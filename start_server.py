#!/usr/bin/env python3
"""
Simple HTTP Server for Billing System
Jalankan file ini untuk memulai server lokal
"""

import os
import sys
import http.server
import socketserver
from pathlib import Path

# Konfigurasi
PORT = 8000
HANDLER = http.server.SimpleHTTPRequestHandler

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # Disable caching untuk pengembangan
        self.send_header('Cache-Control', 'no-store, no-cache, must-revalidate, max-age=0')
        super().end_headers()

    def log_message(self, format, *args):
        # Customize log message
        print(f"[{self.log_date_time_string()}] {format % args}")

def run_server():
    """Menjalankan HTTP server"""
    # Change to script directory
    script_dir = Path(__file__).parent.absolute()
    os.chdir(script_dir)
    
    Handler = MyHTTPRequestHandler
    
    with socketserver.TCPServer(("", PORT), Handler) as httpd:
        print(f"╔════════════════════════════════════════════════╗")
        print(f"║   Billing System - Local Development Server    ║")
        print(f"╚════════════════════════════════════════════════╝")
        print(f"")
        print(f"✓ Server sedang berjalan...")
        print(f"✓ URL: http://localhost:{PORT}")
        print(f"✓ Directory: {script_dir}")
        print(f"")
        print(f"Tekan CTRL+C untuk menghentikan server")
        print(f"{'=' * 50}")
        print(f"")
        
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print(f"\n\n{'=' * 50}")
            print(f"Server dihentikan oleh user")
            print(f"Sampai jumpa! 👋")
            print(f"{'=' * 50}")
            sys.exit(0)

if __name__ == "__main__":
    try:
        run_server()
    except OSError as e:
        if e.errno == 48:  # Port already in use
            print(f"❌ Error: Port {PORT} sudah digunakan!")
            print(f"Silahkan gunakan port lain atau tutup aplikasi yang menggunakan port ini.")
            sys.exit(1)
        else:
            raise
