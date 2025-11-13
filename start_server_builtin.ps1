# Billing System - Simple HTTP Server (PowerShell)
# Tidak memerlukan Python atau Node.js

$port = 8000
$serverHost = "localhost"

# Buat HTTP listener
$listener = New-Object System.Net.HttpListener
# Bind only to localhost addresses to avoid requiring URL ACL for all hostnames
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Prefixes.Add("http://127.0.0.1:$port/")

Write-Host ""
Write-Host "╔════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Billing System - Local Development Server    ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "✓ Server sedang berjalan..." -ForegroundColor Green
Write-Host "✓ URL: http://localhost:$port" -ForegroundColor Green
Write-Host "✓ Directory: $(Get-Location)" -ForegroundColor Green
Write-Host ""
Write-Host "Tekan CTRL+C untuk menghentikan server" -ForegroundColor Yellow
Write-Host ("=" * 50)
Write-Host ""

try {
    try {
        $listener.Start()
    } catch {
        $msg = $_.Exception.Message
        # If the listener failed due to permission (requires admin) try Node.js fallback if available
        $node = Get-Command node -ErrorAction SilentlyContinue
        if ($node) {
            Write-Host "⚠️ HttpListener gagal dimulai: $msg" -ForegroundColor Yellow
            Write-Host "Menjalankan fallback Node.js static server (server.js) ..." -ForegroundColor Yellow
            # Start Node.js fallback with PORT set so server.js binds to the same port
            Start-Process -FilePath 'cmd.exe' -ArgumentList "/c","set PORT=$port&& node server.js" -WorkingDirectory (Get-Location) -WindowStyle Hidden
            Write-Host "Node fallback dijalankan. Buka http://localhost:$port" -ForegroundColor Green
            exit 0
        } else {
            Write-Host "\n❌ HttpListener gagal dimulai: $msg" -ForegroundColor Red
            Write-Host "Jalankan skrip ini sebagai Administrator atau instal Node.js untuk fallback static server." -ForegroundColor Red
            exit 1
        }
    }

    while ($true) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        # Get file path
        $path = $request.Url.LocalPath
        if ($path -eq "/" -or $path -eq "") {
            $path = "/index.html"
        }
        
        $filePath = Join-Path (Get-Location) $path.TrimStart("/")
        
        # MIME types
        $mimeTypes = @{
            ".html" = "text/html"
            ".js"   = "application/javascript"
            ".css"  = "text/css"
            ".json" = "application/json"
            ".png"  = "image/png"
            ".jpg"  = "image/jpeg"
            ".jpeg" = "image/jpeg"
            ".gif"  = "image/gif"
            ".svg"  = "image/svg+xml"
            ".ico"  = "image/x-icon"
            ".txt"  = "text/plain"
            ".woff" = "application/font-woff"
            ".ttf"  = "application/font-ttf"
        }
        
        try {
            if (Test-Path $filePath -PathType Container) {
                $filePath = Join-Path $filePath "index.html"
            }
            
            if (Test-Path $filePath -PathType Leaf) {
                # File found
                $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
                $contentType = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
                
                $response.ContentType = $contentType
                $response.StatusCode = 200
                
                $buffer = [System.IO.File]::ReadAllBytes($filePath)
                $response.OutputStream.Write($buffer, 0, $buffer.Length)
                
                Write-Host "[$(Get-Date -Format 'HH:mm:ss')] GET $($request.Url.LocalPath) (200)" -ForegroundColor Green
            } else {
                # File not found
                $response.StatusCode = 404
                $response.ContentType = "text/html"
                
                $html = @"
<!DOCTYPE html>
<html>
<head>
    <title>404 - Not Found</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        h1 { color: #333; }
        p { color: #666; }
    </style>
</head>
<body>
    <h1>404 - File Not Found</h1>
    <p>Requested file: $($request.Url.LocalPath)</p>
    <a href="/">← Back to Home</a>
</body>
</html>
"@
                
                $buffer = [System.Text.Encoding]::UTF8.GetBytes($html)
                $response.OutputStream.Write($buffer, 0, $buffer.Length)
                
                Write-Host "[$(Get-Date -Format 'HH:mm:ss')] GET $($request.Url.LocalPath) (404)" -ForegroundColor Red
            }
        } catch {
            $response.StatusCode = 500
            $response.ContentType = "text/plain"
            
            $buffer = [System.Text.Encoding]::UTF8.GetBytes("Server Error: $_")
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
            
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] GET $($request.Url.LocalPath) (500)" -ForegroundColor Yellow
        } finally {
            $response.OutputStream.Close()
        }
    }
}
catch {
    if ($_.Exception.Message -like "*already in use*") {
        Write-Host ""
        Write-Host "❌ Error: Port $port sudah digunakan!" -ForegroundColor Red
        Write-Host "Silahkan gunakan port lain atau tutup aplikasi yang menggunakan port ini." -ForegroundColor Red
    } else {
        Write-Host ""
        Write-Host "❌ Error: $_" -ForegroundColor Red
    }
    exit 1
}
finally {
    if ($listener) {
        $listener.Stop()
    }
    Write-Host ""
    Write-Host "=".PadRight(50, "=")
    Write-Host "Server dihentikan" -ForegroundColor Yellow
    Write-Host "Sampai jumpa! 👋" -ForegroundColor Yellow
    Write-Host "=".PadRight(50, "=")
}
