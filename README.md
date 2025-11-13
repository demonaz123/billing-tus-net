# Billing System - Panduan Menjalankan Website

Selamat datang! Dokumen ini berisi panduan lengkap untuk menjalankan Billing System secara lokal.

## 📋 Daftar Isi

1. [Prasyarat](#prasyarat)
2. [Cara Menjalankan](#cara-menjalankan)
3. [Struktur File](#struktur-file)
4. [Fitur Aplikasi](#fitur-aplikasi)
5. [Troubleshooting](#troubleshooting)

---

## 🔧 Prasyarat

### Untuk Windows:
- **Python 3.6 atau lebih tinggi** (untuk HTTP Server)
- **Web Browser modern** (Chrome, Firefox, Edge, Safari)
- **Administrator privileges** (opsional, untuk port < 1024)

### Install Python di Windows:
1. Buka https://www.python.org/downloads/
2. Download Python terbaru (versi 3.9 atau lebih tinggi)
3. Jalankan installer dan pastikan checklist "Add Python to PATH" diaktifkan
4. Klik Install Now
5. Verifikasi instalasi dengan membuka Command Prompt dan jalankan:
   ```
   python --version
   ```

---

## 🚀 Cara Menjalankan

### Metode 1: Double-Click (Paling Mudah)

1. Buka folder `d:\billingtus` di Windows Explorer
2. Double-click pada file **`start_server.bat`**
3. Jendela Command Prompt akan terbuka
4. Tunggu hingga muncul pesan:
   ```
   ✓ Server sedang berjalan...
   ✓ URL: http://localhost:8000
   ```
5. Buka browser dan akses: **http://localhost:8000**
6. Untuk menghentikan server, tutup jendela Command Prompt atau tekan CTRL+C

### Metode 2: PowerShell (Alternatif)

1. Buka PowerShell dengan Administrator privileges
2. Navigasi ke folder project:
   ```powershell
   cd d:\billingtus
   ```
3. Jalankan script:
   ```powershell
   .\start_server.ps1
   ```
4. Buka browser dan akses: **http://localhost:8000**

### Metode 3: Command Prompt Manual

1. Buka Command Prompt (cmd.exe)
2. Navigasi ke folder project:
   ```cmd
   cd d:\billingtus
   ```
3. Jalankan:
   ```cmd
   python start_server.py
   ```
4. Buka browser dan akses: **http://localhost:8000**

---

## 📁 Struktur File

```
billingtus/
├── index.html                    # File utama (halaman dashboard)
├── start_server.py              # Script Python untuk menjalankan server
├── start_server.bat             # Script untuk Windows CMD
├── start_server.ps1             # Script untuk PowerShell
├── README.md                    # File dokumentasi ini
│
├── billingtusnet.bayarinternet.com/
│   ├── admin/
│   │   ├── dashboard.html       # Dashboard admin
│   │   └── notifications.html   # Notifikasi
│   │
│   ├── api/
│   │   └── update-notifications/
│   │       └── check.html
│   │
│   ├── assets/
│   │   ├── custom.css           # CSS custom
│   │   ├── leaflet/             # Leaflet maps library
│   │   ├── libs/                # Library eksternal
│   │   ├── dist/                # Tabler CSS & JS
│   │   ├── js/
│   │   │   ├── demo.js
│   │   │   └── src/
│   │   │       ├── tabler.js
│   │   │       ├── dropdown.js
│   │   │       └── ... (JS utilities)
│   │   └── preview/             # Demo CSS
│   │
│   ├── js/
│   │   └── demo.js
│   │
│   └── uploads/
│       └── company/             # Folder untuk upload gambar
│
├── cdn.datatables.net/          # DataTables library
├── cdn.jsdelivr.net/            # CDN assets
├── cdnjs.cloudflare.com/        # Cloudflare CDN
├── unpkg.com/                   # NPM CDN
└── ... (folder CDN lainnya)
```

---

## ✨ Fitur Aplikasi

### Dashboard
- 📊 Statistik pelanggan real-time
- 💰 Ringkasan keuangan dan pendapatan
- 📈 Grafik tren pendapatan
- 👥 Status distribusi pelanggan

### Manajemen Pelanggan
- Daftar semua pelanggan
- Tambah pelanggan baru
- Edit data pelanggan
- Monitoring status pelanggan

### Manajemen Tagihan
- Daftar tagihan
- Buat tagihan baru
- Track pembayaran
- Monitor tagihan terlambat

### Pengaturan Sistem
- Konfigurasi umum
- Pengaturan perusahaan
- Manajemen pengguna

---

## 🔐 Keamanan dan Port

- **Port Default**: 8000
- **Akses Lokal**: http://localhost:8000
- **Akses dari Jaringan**: http://<IP_KOMPUTER>:8000
- **Server berjalan tanpa enkripsi** (development only)

Jika port 8000 sudah digunakan:
1. Edit file `start_server.py`
2. Ubah `PORT = 8000` menjadi port lain (misal `PORT = 8001`)
3. Jalankan ulang server

---

## 🐛 Troubleshooting

### Problem: "Python tidak ditemukan"
**Solusi:**
1. Pastikan Python terinstall: https://www.python.org/downloads/
2. Saat install, centang "Add Python to PATH"
3. Restart Command Prompt setelah install

### Problem: "Port 8000 sudah digunakan"
**Solusi:**
1. Gunakan port berbeda:
   ```cmd
   python -m http.server 8001
   ```
2. Atau tutup aplikasi yang menggunakan port 8000

### Problem: "File CSS/JS tidak termuat"
**Solusi:**
1. Pastikan struktur folder benar
2. Buka browser DevTools (F12)
3. Cek Network tab untuk melihat file mana yang error
4. Pastikan file path di index.html sesuai dengan struktur folder

### Problem: "ERR_FILE_NOT_FOUND"
**Solusi:**
1. Pastikan browser mengakses `http://localhost:8000` (bukan folder path)
2. Pastikan file `index.html` ada di folder `d:\billingtus\`
3. Hard refresh browser: CTRL+SHIFT+R

### Problem: "Grafik tidak ditampilkan"
**Solusi:**
1. Periksa apakah ApexCharts berhasil diload di browser DevTools Console
2. Pastikan internet connection aktif (untuk CDN)
3. Cek browser console untuk error messages

---

## 🌐 Akses dari Perangkat Lain

Jika ingin akses website dari komputer/smartphone lain:

1. Temukan IP Address komputer Anda:
   ```cmd
   ipconfig
   ```
   Catat IPv4 Address (misal: 192.168.1.100)

2. Di perangkat lain, akses:
   ```
   http://192.168.1.100:8000
   ```

**Note**: Kedua perangkat harus dalam jaringan yang sama (LAN)

---

## 📚 Dependencies

Website ini menggunakan library dan framework berikut:

### Frontend Framework
- **Bootstrap 5**: UI framework
- **Tabler**: Admin dashboard template

### Libraries
- **ApexCharts**: Charting library
- **jQuery**: JavaScript utility
- **DataTables**: Advanced table plugin
- **Leaflet**: Map library
- **Tom Select**: Select component

### CDN Providers
- jsDelivr
- Cloudflare
- CDNJS
- unpkg

---

## 🔄 Update dan Maintenance

### Menambah File Baru
1. Pastikan server sudah berjalan
2. Copy file ke folder yang sesuai
3. Hard refresh browser (CTRL+SHIFT+R)

### Edit CSS/JavaScript
1. Edit file langsung
2. Hard refresh browser untuk melihat perubahan
3. Cek browser console (F12) untuk error

### Backup Data
Tidak ada database pada versi awal ini. Semua data bersifat demo/placeholder.

---

## 📞 Support & Resources

### Dokumentasi Resmi
- [Tabler Docs](https://tabler.io)
- [Bootstrap Docs](https://getbootstrap.com/docs)
- [ApexCharts Docs](https://apexcharts.com)

### Community
- Stack Overflow
- GitHub Discussions
- Official Forums

---

## 📝 Lisensi

Billing System © 2025 - Bayar Internet

---

## 🎯 Langkah Selanjutnya

Setelah berhasil menjalankan website:

1. **Customize Branding**
   - Ubah logo di folder `uploads/company/`
   - Edit nama perusahaan di pengaturan

2. **Setup Database** (Opsional)
   - Integrasikan dengan database MySQL/PostgreSQL
   - Setup backend API

3. **Add Authentication**
   - Implementasi login system
   - Setup session management

4. **Deployment**
   - Upload ke hosting server
   - Setup domain
   - Configure SSL certificate

---

## ✅ Checklist Setup Awal

- [ ] Python terinstall
- [ ] Navigasi ke folder billingtus
- [ ] Jalankan start_server.bat atau start_server.py
- [ ] Server menjalankan di http://localhost:8000
- [ ] Buka index.html di browser
- [ ] Semua CSS & JS termuat dengan benar
- [ ] Grafik dashboard menampilkan dengan baik
- [ ] Navigasi menu berfungsi

---

## 🎉 Selamat!

Website Billing System sudah siap digunakan! Selamat mengembangkan aplikasi Anda lebih lanjut.

Jika ada pertanyaan atau masalah, silahkan cek section Troubleshooting atau buat issue di repository.

Happy coding! 🚀
