# 📊 BILLING SYSTEM - PANDUAN LENGKAP

Selamat datang ke **Billing System** - Aplikasi Manajemen Tagihan yang Modern dan Responsif!

Dokumen ini akan memandu Anda untuk menjalankan website billing system ini dengan mudah.

---

## 🎯 Apa itu Billing System?

Billing System adalah aplikasi web untuk mengelola:
- 👥 Data Pelanggan Internet Service Provider (ISP)
- 💰 Tagihan dan Invoice pelanggan
- 📊 Statistik dan Laporan keuangan
- 📈 Grafik dan Analytics real-time
- 🗺️ Peta coverage area jaringan
- 🔔 Sistem notifikasi dan reminder

---

## ⚡ Quick Start (3 Langkah Mudah)

### Langkah 1: Buka Folder Project
```
Navigasi ke: d:\billingtus
```

### Langkah 2: Double-Click File LAUNCH
```
Klik dua kali: LAUNCH.bat
```

### Langkah 3: Pilih Opsi Pembukaan
```
Pilih opsi 1, 2, atau 3 sesuai keinginan
```

Website akan terbuka di browser Anda! 🎉

---

## 📂 Struktur File Project

```
d:\billingtus/
│
├── 📄 index.html                          ← MAIN FILE (File Utama)
├── 📄 LAUNCH.bat                          ← Double-click ini!
├── 📄 QUICKSTART.md                       ← Quick start guide
├── 📄 README.md                           ← Full documentation
├── 📄 SETUP-PANDUAN.md                    ← File ini
│
├── 🐍 start_server.py                     ← Python server script
├── 🟩 start_server_node.bat               ← Node.js server launcher
├── 💻 start_server.bat                    ← CMD launcher
├── 📜 start_server.ps1                    ← PowerShell launcher
├── 💙 start_server_builtin.ps1            ← Built-in PS server
├── 📗 server.js                           ← Node.js server
│
├── 📁 billingtusnet.bayarinternet.com/    ← Web Assets
│   ├── admin/                             ← Admin pages
│   │   ├── dashboard.html                 ← Dashboard template
│   │   └── notifications.html             ← Notifications template
│   ├── api/                               ← API endpoints
│   ├── assets/                            ← CSS & JS files
│   │   ├── custom.css                     ← Custom styling
│   │   ├── dist/                          ← Tabler framework
│   │   ├── libs/                          ← Third-party libs
│   │   ├── leaflet/                       ← Map library
│   │   ├── js/                            ← JavaScript files
│   │   └── preview/                       ← Demo assets
│   ├── js/                                ← Application JS
│   └── uploads/                           ← User uploads
│
├── 📁 cdn.datatables.net/                 ← DataTables CDN
├── 📁 cdn.jsdelivr.net/                   ← JSDelivr CDN
├── 📁 cdnjs.cloudflare.com/               ← Cloudflare CDN
├── 📁 unpkg.com/                          ← NPM packages CDN
├── 📁 rsms.me/                            ← Inter font files
└── 📁 _DataURI/                           ← Embedded data
```

---

## 🚀 3 Cara Menjalankan Website

### ✅ CARA 1: Paling Mudah (Tanpa Setup)

**Langkah:**
1. Navigasi ke folder `d:\billingtus\`
2. Double-click file **`LAUNCH.bat`**
3. Pilih opsi **`1`** untuk membuka langsung
4. Website akan terbuka di browser default Anda

**Kelebihan:**
- ✓ Paling cepat
- ✓ Tidak perlu install apa-apa
- ✓ Langsung bisa digunakan

**Kekurangan:**
- ✗ File:// protocol mungkin memiliki keterbatasan CORS
- ✗ Beberapa fitur external mungkin tidak berfungsi optimal

---

### ✅ CARA 2: Dengan Python HTTP Server

**Prasyarat:**
- Python 3.6+ terinstall (https://www.python.org/downloads/)
- Pastikan "Add Python to PATH" dicentang saat install

**Langkah:**
1. Double-click file **`LAUNCH.bat`**
2. Pilih opsi **`2`**
3. Tunggu pesan: "Serving HTTP on 0.0.0.0 port 8000"
4. Buka browser: **http://localhost:8000**
5. Tekan CTRL+C untuk stop server

**Kelebihan:**
- ✓ Full HTTP protocol support
- ✓ Semua fitur berfungsi sempurna
- ✓ Performance optimal
- ✓ Bisa diakses dari jaringan

**Kekurangan:**
- ✗ Perlu install Python
- ✗ Sedikit lebih slow dari file://

---

### ✅ CARA 3: Dengan Node.js Server

**Prasyarat:**
- Node.js v12+ terinstall (https://nodejs.org/)

**Langkah:**
1. Double-click file **`start_server_node.bat`**
2. Tungup pesan: "Server running at http://localhost:8000"
3. Buka browser: **http://localhost:8000**
4. Tekan CTRL+C untuk stop server

**Kelebihan:**
- ✓ Performance sangat baik
- ✓ HTTP server native
- ✓ Cocok untuk production

**Kekurangan:**
- ✗ Perlu install Node.js

---

## 🎯 Mengakses Website

### Akses Lokal (dari komputer yang sama)
```
http://localhost:8000
```

### Akses dari Jaringan (dari komputer/HP lain)
```
http://<IP_KOMPUTER>:8000
```

**Cara cari IP komputer Anda:**
1. Buka Command Prompt
2. Ketik: `ipconfig`
3. Catat angka di "IPv4 Address" (misal: 192.168.1.100)
4. Dari device lain: `http://192.168.1.100:8000`

---

## 🎨 Fitur Website

### Dashboard
```
📊 Statistik Real-Time
├── Total Pelanggan
├── Pelanggan Aktif
├── Total Pendapatan
└── Tagihan Terbayar

📈 Grafik
├── Pie Chart - Status Pelanggan
├── Donut Chart - Status Tagihan
├── Area Chart - Revenue Trend
├── Line Chart - Customer Growth
└── Polar Chart - Connection Types
```

### Manajemen Pelanggan
```
👥 Fitur
├── Daftar semua pelanggan
├── Tambah pelanggan baru
├── Edit data pelanggan
├── Hapus pelanggan
└── Search & Filter
```

### Manajemen Tagihan
```
💰 Fitur
├── Daftar invoice
├── Buat invoice baru
├── Track pembayaran
├── Monitor tunggakan
└── Export report
```

### Settings
```
⚙️ Fitur
├── Pengaturan umum
├── Branding (logo, warna)
├── Payment gateway
├── User management
└── API configuration
```

---

## 🛠️ Technologies & Libraries

### Frontend Framework
- **Bootstrap 5** - CSS Framework untuk responsive design
- **Tabler** - Admin dashboard template profesional

### Charting & Visualization
- **ApexCharts** - Library untuk membuat charts
- **Leaflet** - Interactive maps library

### Tables & UI Components
- **DataTables** - Advanced table plugin
- **Tom Select** - Select dropdown component
- **jQuery** - JavaScript utility library

### Maps & Routing
- **Leaflet Draw** - Drawing tools untuk maps
- **Leaflet Routing Machine** - Route planning
- **GeoSearch** - Geographic search

### Icon Library
- **Tabler Icons** - SVG icon set (1000+ icons)

### Font
- **Inter** - Modern font family

### CDN Providers
- jsDelivr
- Cloudflare
- CDNJS
- unpkg
- rsms.me

---

## 🔧 Konfigurasi & Customization

### Mengubah Port
Jika port 8000 sudah digunakan, edit file server:

**Untuk Python:**
```
python -m http.server 8001
```

**Untuk Node.js:**
Edit `server.js`, ubah `const PORT = 8000;` menjadi `8001`

### Mengubah Logo & Branding
1. Edit `index.html`
2. Ubah `<h5 class="mb-0">📊 Billing System</h5>` dengan nama Anda
3. Simpan & refresh browser

### Mengubah Warna Tema
Edit CSS di `billingtusnet.bayarinternet.com/assets/custom.css`:
```css
:root {
    --bs-primary: #0dcaf0;    /* Warna primary */
    --bs-success: #198754;    /* Warna success */
    --bs-danger: #dc3545;     /* Warna danger */
    /* ... dan seterusnya */
}
```

### Menambah Menu Navigation
Edit `index.html`, tambah di section `<ul class="navbar-nav">`:
```html
<li class="nav-item">
    <a class="nav-link" href="#newpage" data-section="newpage">
        <span class="nav-link-icon">⭐</span>
        <span class="nav-link-title">Halaman Baru</span>
    </a>
</li>
```

---

## 🐛 Troubleshooting

### Problem 1: Browser Error "Cannot GET /"
**Solusi:**
- Pastikan file `index.html` ada di folder `d:\billingtus\`
- Hard refresh browser: CTRL+SHIFT+R
- Cek path di URL bar: `http://localhost:8000`

### Problem 2: CSS/JS tidak termuat
**Solusi:**
1. Buka DevTools (F12)
2. Lihat Network tab
3. Cari file yang error (merah)
4. Cek file path di HTML
5. Pastikan struktur folder sesuai

### Problem 3: Grafik tidak tampil
**Solusi:**
1. Cek internet connection (ApexCharts dari CDN)
2. Buka Console (F12 → Console)
3. Lihat error message
4. Hard refresh: CTRL+SHIFT+R

### Problem 4: "Port sudah digunakan"
**Solusi:**
```powershell
# Cari process yang pakai port 8000
netstat -ano | findstr :8000

# Kill process (ganti PID dengan angka dari output di atas)
taskkill /PID <PID> /F

# Atau gunakan port berbeda
python -m http.server 8001
```

### Problem 5: "Python/Node tidak ditemukan"
**Solusi:**
- Install Python: https://www.python.org/downloads/
- Install Node.js: https://nodejs.org/
- **PENTING**: Saat install, centang "Add to PATH"
- Restart Command Prompt setelah install

### Problem 6: Error saat membuka file
**Solusi:**
1. Jangan gunakan file:// protocol (ada CORS issues)
2. Gunakan HTTP server dengan CARA 2 atau 3
3. Atau double-click LAUNCH.bat dan pilih opsi 2/3

---

## 📊 Data Demo

Website ini dilengkapi dengan data demo:

```javascript
{
    "customerStatus": {
        "labels": ["Aktif", "Tidak Aktif", "Disuspend"],
        "data": [0, 0, 0]
    },
    "invoiceStatus": {
        "labels": ["Terbayar", "Belum Dibayar", "Terlambat"],
        "data": [0, 0, 0]
    },
    "monthlyRevenue": {
        "categories": [],
        "data": []
    }
}
```

Untuk mengubah data, edit `index.html` atau integrasikan dengan database real.

---

## 📚 Dokumentasi Lengkap

Untuk informasi lebih detail, lihat file:
- **README.md** - Dokumentasi komprehensif
- **QUICKSTART.md** - Panduan cepat
- **index.html** - Source code website

---

## 🌐 Browser Support

Website ini compatible dengan:
- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+
- ✅ Opera 76+
- ✅ Mobile browsers (iOS Safari, Chrome Mobile)

---

## 📱 Responsive Design

Website ini fully responsive:
- 📱 **Mobile** (320px - 768px)
- 📱 **Tablet** (768px - 1024px)
- 💻 **Desktop** (1024px+)
- 🖥️ **Large Screens** (1920px+)

Buka DevTools (F12) → Toggle device toolbar untuk test responsive.

---

## 🔐 Security Notes

### Development Only
Website ini adalah **development version**:
- ❌ Tidak ada authentication
- ❌ Tidak ada database
- ❌ Tidak ada encryption
- ✅ Untuk production, implementasikan security layers

### Untuk Production
1. Setup backend API dengan security
2. Implementasi user authentication
3. Setup HTTPS/SSL
4. Configure CORS properly
5. Database & data validation
6. Rate limiting & DDoS protection

---

## 💾 Backup & Save

### Backup Data
```
Copy folder d:\billingtus ke lokasi aman
```

### Version Control (Git)
```bash
cd d:\billingtus
git init
git add .
git commit -m "Initial commit"
```

---

## 🔄 Update & Upgrade

### Update CSS/JS
1. Edit file di folder assets
2. Hard refresh browser (CTRL+SHIFT+R)
3. Clear browser cache jika perlu

### Update Framework
- Lihat dokumentasi Tabler: https://tabler.io
- Update Bootstrap: https://getbootstrap.com
- Update ApexCharts: https://apexcharts.com

---

## 📞 Support & Resources

### Official Documentation
- [Tabler Dashboard Docs](https://tabler.io/docs)
- [Bootstrap Docs](https://getbootstrap.com/docs)
- [ApexCharts Docs](https://apexcharts.com/docs)
- [Leaflet Docs](https://leafletjs.com)

### Community & Help
- Stack Overflow (tag pertanyaan dengan `html`, `bootstrap`, `javascript`)
- GitHub Issues (untuk bug reports)
- Official Forums (lihat di website masing-masing)

### Development Tools
- VS Code (https://code.visualstudio.com) - Text editor terbaik
- DevTools (F12) - Browser debugging
- Postman - API testing (untuk future backend)

---

## ✅ Setup Verification Checklist

Pastikan semua ini sudah dilakukan:

- [ ] Folder `d:\billingtus` sudah ada
- [ ] File `index.html` bisa dilihat di folder
- [ ] Browser bisa membuka `http://localhost:8000`
- [ ] CSS styling termuat (warna dan layout benar)
- [ ] JavaScript berfungsi (menu bisa diklik)
- [ ] Grafik bisa ditampilkan
- [ ] Responsive design work di mobile (F12 → device toggle)
- [ ] Dark mode toggle berfungsi (sun/moon icon)
- [ ] Network requests normal (F12 → Network tab)
- [ ] Console tidak ada error (F12 → Console tab)

Jika semua centang ✓, website siap digunakan!

---

## 🎉 Selesai!

Website **Billing System** Anda sudah berhasil di-setup!

### Next Steps:
1. **Customize** - Ubah logo, warna, dan nama sesuai brand Anda
2. **Add Data** - Integrasikan dengan database
3. **Add Features** - Tambah fitur sesuai kebutuhan
4. **Deploy** - Upload ke hosting server
5. **Monitor** - Tracking usage dan performance

---

## 📝 Catatan Penting

- Website ini adalah **template/skeleton** - Anda perlu customize sesuai kebutuhan
- Data yang ditampilkan adalah **demo/placeholder** - bukan data real
- Untuk production, setup dengan proper backend dan database
- Jangan lupa backup data Anda
- Test di berbagai browser sebelum deploy

---

## 🙏 Terima Kasih!

Terima kasih telah menggunakan Billing System!

Semoga website ini membantu Anda mengelola bisnis ISP dengan lebih baik.

**Happy coding & good luck! 🚀**

---

**Version**: 1.0.0  
**Last Updated**: November 2025  
**License**: Open Source

Untuk pertanyaan atau masalah, silahkan baca README.md atau QUICKSTART.md.
