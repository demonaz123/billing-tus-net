#!/usr/bin/env node

/**
 * Simple HTTP Server for Billing System
 * Requirements: Node.js v12+
 * 
 * Usage: node server.js
 * Access: http://localhost:8000
 */

const http = require('http');
const fs = require('fs');
const path = require('path');
const url = require('url');

// Allow overriding port via environment (useful if 8000 is restricted).
const PORT = parseInt(process.env.PORT, 10) || 8001;
// Bind to all interfaces so localhost/127.0.0.1 and network IPs work
const HOST = '0.0.0.0';

// MIME types
const mimeTypes = {
    '.html': 'text/html; charset=UTF-8',
    '.js': 'application/javascript',
    '.css': 'text/css',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.jpeg': 'image/jpeg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.webp': 'image/webp',
    '.ico': 'image/x-icon',
    '.txt': 'text/plain',
    '.wav': 'audio/wav',
    '.mp4': 'video/mp4',
    '.woff': 'application/font-woff',
    '.ttf': 'application/font-ttf',
    '.eot': 'application/vnd.ms-fontobject',
    '.otf': 'application/font-otf',
    '.wasm': 'application/wasm'
};

// Create server
const server = http.createServer((req, res) => {
    // Parse URL
    const parsedUrl = url.parse(req.url, true);
    let pathname = parsedUrl.pathname;

    // Default to index.html for root
    if (pathname === '/' || pathname === '') {
        pathname = '/index.html';
    }

    // Normalize and map common absolute paths used in the original project
    // Many files reference absolute paths like /assets/... or /admin/... which
    // actually live under ./billingtusnet.bayarinternet.com/. Map those here.
    let filePath = path.join(__dirname, pathname);

    // If file doesn't exist at the straightforward path, try mappings
    function tryFallbacks(p) {
        // Try mapping to billingtusnet.bayarinternet.com root
        let candidate = path.join(__dirname, 'billingtusnet.bayarinternet.com', p.replace(/^\//, ''));
        if (fs.existsSync(candidate)) return candidate;

        // Map /assets/* to billingtusnet.bayarinternet.com/assets/*
        if (p.startsWith('/assets/')) {
            candidate = path.join(__dirname, 'billingtusnet.bayarinternet.com', p.replace(/^\//, ''));
            if (fs.existsSync(candidate)) return candidate;
        }

        // Map /uploads/* to billingtusnet.bayarinternet.com/uploads/*
        if (p.startsWith('/uploads/') || p.startsWith('/uploads')) {
            candidate = path.join(__dirname, 'billingtusnet.bayarinternet.com', p.replace(/^\//, ''));
            if (fs.existsSync(candidate)) return candidate;
        }

        // Map /admin/* to billingtusnet.bayarinternet.com/admin/*
        if (p.startsWith('/admin/')) {
            candidate = path.join(__dirname, 'billingtusnet.bayarinternet.com', p.replace(/^\//, ''));
            if (fs.existsSync(candidate)) return candidate;
        }

        // As a last resort, try the path relative to project root
        candidate = path.join(__dirname, p.replace(/^\//, ''));
        if (fs.existsSync(candidate)) return candidate;

        return null;
    }

    // Security: Prevent directory traversal
    const basePath = path.resolve(__dirname);

    let realPath = null;
    if (fs.existsSync(filePath)) {
        realPath = path.resolve(filePath);
    } else {
        const fb = tryFallbacks(pathname);
        if (fb) realPath = path.resolve(fb);
    }

    if (!realPath) {
        // Not found - return 404 page
        res.statusCode = 404;
        res.setHeader('Content-Type', 'text/html; charset=UTF-8');
        res.end(`<!DOCTYPE html><html><head><meta charset="utf-8"/><title>404 - Not Found</title></head><body style="font-family:Arial,Helvetica,sans-serif;padding:40px;text-align:center;"><h1>404 - File Not Found</h1><p>Requested: ${pathname}</p><p><a href="/">Back to Home</a></p></body></html>`);
        console.log(`[${new Date().toLocaleTimeString()}] ${req.method} ${req.url} (404)`);
        return;
    }

    if (!realPath.startsWith(basePath)) {
        res.statusCode = 403;
        res.end('Access Denied');
        return;
    }

    // Check if it's a directory; if so, try index.html
    fs.stat(realPath, (statErr, stats) => {
        if (statErr) {
            res.statusCode = 500;
            res.end(`Server error: ${statErr.code}`);
            console.error(statErr);
            return;
        }

        let fileToRead = realPath;
        if (stats.isDirectory()) {
            // Try index.html in the directory
            fileToRead = path.join(realPath, 'index.html');
        }

        // Read file
        fs.readFile(fileToRead, (err, data) => {
            if (err) {
                res.statusCode = 500;
                res.end(`Server error: ${err.code}`);
                console.error(err);
                return;
            }

            // Get file extension
            const ext = path.extname(fileToRead).toLowerCase();
            const contentType = mimeTypes[ext] || 'application/octet-stream';

            // Set headers
            res.statusCode = 200;
            res.setHeader('Content-Type', contentType);
            res.setHeader('Cache-Control', 'no-store, no-cache, must-revalidate, max-age=0');
            res.setHeader('Pragma', 'no-cache');
            res.setHeader('Expires', '0');
            res.setHeader('Access-Control-Allow-Origin', '*');

            // Send file
            res.end(data);

            // Log
            console.log(`[${new Date().toLocaleTimeString()}] ${req.method} ${req.url} (200)`);
        });
    });
});

// Start server
server.listen(PORT, HOST, () => {
    console.log('');
    console.log('╔════════════════════════════════════════════════╗');
    console.log('║   Billing System - Local Development Server    ║');
    console.log('╚════════════════════════════════════════════════╝');
    console.log('');
    console.log(`✓ Server sedang berjalan...`);
    console.log(`✓ URL: http://${HOST}:${PORT}`);
    console.log(`✓ Directory: ${__dirname}`);
    console.log('');
    console.log('Tekan CTRL+C untuk menghentikan server');
    console.log('='.repeat(50));
    console.log('');
});

// Handle errors
server.on('error', (err) => {
    if (err.code === 'EADDRINUSE') {
        console.error(`❌ Error: Port ${PORT} sudah digunakan!`);
        console.error(`Silahkan gunakan port lain atau tutup aplikasi yang menggunakan port ini.`);
        process.exit(1);
    } else {
        throw err;
    }
});

// Handle shutdown
process.on('SIGINT', () => {
    console.log('\n\n' + '='.repeat(50));
    console.log('Server dihentikan oleh user');
    console.log('Sampai jumpa! 👋');
    console.log('='.repeat(50));
    process.exit(0);
});
