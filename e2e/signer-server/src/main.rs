mod handler;
mod protocol;

use clap::Parser;
use handler::SignerState;
use tokio::io::{AsyncReadExt, AsyncWriteExt};
use tokio::net::TcpListener;

#[derive(Parser)]
#[command(name = "signer-server", about = "Hardware signer test server for MPC wallet")]
struct Args {
    /// Port to listen on
    #[arg(long, default_value = "9090")]
    port: u16,
}

#[tokio::main]
async fn main() {
    let args = Args::parse();
    let addr = format!("0.0.0.0:{}", args.port);

    let listener = TcpListener::bind(&addr)
        .await
        .expect("Failed to bind TCP listener");

    println!("Signer server listening on {}", addr);

    loop {
        let (socket, peer) = match listener.accept().await {
            Ok(conn) => conn,
            Err(e) => {
                eprintln!("Accept error: {}", e);
                continue;
            }
        };

        println!("New connection from {}", peer);

        tokio::spawn(async move {
            if let Err(e) = handle_connection(socket).await {
                eprintln!("Connection error ({}): {}", peer, e);
            }
            println!("Connection closed ({})", peer);
        });
    }
}

/// Handle a single TCP connection.
///
/// Protocol: 4-byte big-endian length prefix + JSON payload.
async fn handle_connection(
    mut socket: tokio::net::TcpStream,
) -> Result<(), Box<dyn std::error::Error>> {
    let mut state = SignerState::new();

    loop {
        // Read 4-byte length prefix
        let mut len_buf = [0u8; 4];
        match socket.read_exact(&mut len_buf).await {
            Ok(_) => {}
            Err(ref e) if e.kind() == std::io::ErrorKind::UnexpectedEof => {
                // Client disconnected
                return Ok(());
            }
            Err(e) => return Err(e.into()),
        }

        let msg_len = u32::from_be_bytes(len_buf) as usize;
        if msg_len > 10 * 1024 * 1024 {
            return Err("message too large (>10MB)".into());
        }

        // Read JSON payload
        let mut buf = vec![0u8; msg_len];
        socket.read_exact(&mut buf).await?;

        let json_str = std::str::from_utf8(&buf)?;

        // Parse request
        let response = match serde_json::from_str::<protocol::Request>(json_str) {
            Ok(req) => {
                println!("  Request: {:?}", std::mem::discriminant(&req));
                state.handle(req)
            }
            Err(e) => protocol::Response::Error {
                error: format!("invalid request: {}", e),
            },
        };

        // Serialize response
        let resp_json = serde_json::to_string(&response)?;
        let resp_bytes = resp_json.as_bytes();

        // Write 4-byte length prefix + JSON
        let len_bytes = (resp_bytes.len() as u32).to_be_bytes();
        socket.write_all(&len_bytes).await?;
        socket.write_all(resp_bytes).await?;
        socket.flush().await?;
    }
}
