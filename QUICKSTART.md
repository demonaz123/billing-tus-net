# QUICK START - Billing System

Selamat datang! Berikut adalah 3 cara termudah untuk menjalankan Billing System:

## 🚀 Cara Tercepat (Tanpa Server)

### Option 1: Buka index.html langsung di browser
1. Buka Windows Explorer
2. Navigasi ke folder: `d:\billingtus\`
3. Double-click file **`index.html`**
4. Website akan terbuka di browser Anda
5. **Catatan**: Beberapa fitur CDN mungkin tidak berfungsi dari file:// protocol

---

## 🚀 Cara Dengan Server (Recommended)

### Option 2: Menggunakan Node.js (Jika terinstall)
**Prasyarat**: Node.js v12+ harus terinstall

1. Double-click: **`start_server_node.bat`**
2. Tunggu pesan: "Server sedang berjalan..."
3. Buka browser: **http://localhost:8000**
4. Done! ✨

**Install Node.js**: https://nodejs.org/ (pilih LTS)

---

### Option 3: Menggunakan PowerShell Built-in (Windows 10+)
**Prasyarat**: Windows 10 atau lebih tinggi (tidak perlu install apa-apa)

**Step 1**: Buka PowerShell sebagai Administrator
- Klik Start Menu
- Ketik: `PowerShell`
- Klik kanan → Run as Administrator

**Step 2**: Copy & paste command ini:
```powershell
cd 'd:\billingtus' ; python -m http.server 8000
```

Jika tidak ada Python, gunakan command ini:
```powershell
cd 'd:\billingtus' ; $listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add("http://+:8000/"); $listener.Start(); Write-Host 'Server running at http://localhost:8000'; while($true) { $ctx = $listener.GetContext(); $req = $ctx.Request; $res = $ctx.Response; $path = if($req.Url.LocalPath -eq "/") { "/index.html" } else { $req.Url.LocalPath }; $file = Join-Path 'd:\billingtus' $path.TrimStart('/'); if((Test-Path $file -PathType Leaf) -and $file.StartsWith('d:\billingtus')) { $res.StatusCode = 200; $res.OutputStream.Write([System.IO.File]::ReadAllBytes($file), 0, (Get-Item $file).Length) } else { $res.StatusCode = 404; $res.OutputStream.Write([System.Text.Encoding]::UTF8.GetBytes("<h1>404</h1>"), 0, 9) }; $res.OutputStream.Close() }
```

**Step 3**: Buka browser: **http://localhost:8000**

---

## 📋 Perbandingan Metode

| Metode | Mudah | Server | Performa | Syarat |
|--------|-------|--------|----------|--------|
| Direct Open (File) | ✅✅✅ | ❌ | ⭐⭐ | Tidak ada |
| Node.js Server | ✅✅ | ✅ | ⭐⭐⭐ | Node.js |
| PowerShell | ✅ | ✅ | ⭐⭐⭐ | Windows 10+ |
| Python Server | ✅ | ✅ | ⭐⭐⭐ | Python 3.6+ |

---

## ❓ Troubleshooting

### "Port 8000 sudah digunakan"
```powershell
# Gunakan port berbeda
python -m http.server 8001
```

### "Cannot access a disposed object"
Tutup terminal dan buka yang baru

### "Access is denied"
Jalankan PowerShell sebagai Administrator

### "File tidak ditemukan"
Pastikan navigasi ke folder `d:\billingtus` sebelum menjalankan command

---

## 🎯 Setelah Server Berjalan

1. **Buka browser**: http://localhost:8000
2. **Lihat Dashboard**: Dashboard akan menampilkan dengan statistik demo
3. **Navigasi Menu**: 
   - Dashboard - Beranda dengan statistik
   - Pelanggan - Manajemen data pelanggan
   - Tagihan - Manajemen invoices
   - Pengaturan - Konfigurasi sistem

4. **Cek Grafik**: ApexCharts akan menampilkan pie charts dan donut charts

5. **Test Mode Toggle**: Klik moon/sun icon untuk toggle dark mode

---

## 📚 File Penting

```
d:\billingtus\
├── index.html                    ← File utama (buka ini!)
├── start_server_node.bat         ← Jalankan ini (jika punya Node.js)
├── start_server_builtin.ps1     ← PowerShell script
├── README.md                     ← Dokumentasi lengkap
└── QUICKSTART.md                ← File ini
```

---

## 🌐 Struktur Website

Website ini adalah billing system dengan:

### Dashboard
- 📊 4 Kartu statistik (Total Pelanggan, Aktif, Pendapatan, Tagihan Terbayar)
- 📈 2 Grafik (Status Pelanggan & Status Tagihan)
- 🎨 Dark mode support
- 📱 Responsive design (mobile-friendly)

### Halaman Tambahan
- **Pelanggan**: Daftar dan manajemen pelanggan
- **Tagihan**: Daftar dan manajemen invoice
- **Pengaturan**: Konfigurasi sistem

---

## 🔗 Dependencies yang Digunakan

Semua library dimuat dari CDN (tidak perlu install):
- ✅ Bootstrap 5 - CSS Framework
- ✅ jQuery - JavaScript Library
- ✅ ApexCharts - Charting
- ✅ DataTables - Advanced Tables
- ✅ Tabler - Admin Template
- ✅ Leaflet - Maps

---

## ✅ Checklist

- [ ] Buka file ini (QUICKSTART.md)
- [ ] Pilih salah satu cara di atas
- [ ] Jalankan server/buka index.html
- [ ] Akses http://localhost:8000 di browser
- [ ] Lihat dashboard dengan statistik
- [ ] Coba klik menu navigation
- [ ] Coba toggle dark mode
- [ ] Selesai! ✨

---

## 💡 Tips

1. **Hard Refresh Browser**: CTRL+SHIFT+R (untuk clear cache)
2. **Check Console**: F12 → Console tab (untuk debug)
3. **Mobile Testing**: F12 → Toggle device toolbar (responsive test)
4. **Save File**: CTRL+S di editor untuk update file

---

## 🆘 Bantuan Lebih Lanjut

Jika punya error, cek:
1. `README.md` - Dokumentasi lengkap
2. `index.html` - Cek structure file
3. Network tab F12 - Lihat file mana yang error
4. Browser console F12 - Lihat error messages

---

Selamat menggunakan Billing System! 🚀

Pertanyaan? Lihat README.md untuk info lebih detail.
