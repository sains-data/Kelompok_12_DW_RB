# 📦 Proyek Data Warehouse - Industri Pariwisata & Hospitality

Repositori ini merupakan dokumentasi proyek tugas besar dari mata kuliah **Pemrograman Berbasis Fungsi - Sains Data** di **Institut Teknologi Sumatera (ITERA)**. Proyek ini berfokus pada **perancangan dan implementasi data warehouse** untuk sektor pariwisata dan hospitality, dengan studi kasus perusahaan fiktif *Demond Stay Group*.

## 🎯 Tujuan Proyek

- Mengintegrasikan data reservasi, pelanggan, dan operasional hotel ke dalam satu sistem terpusat.
- Menerapkan arsitektur **Medallion**: Bronze, Silver, dan Gold Layer.
- Membangun pipeline **ETL** menggunakan SQL Server Integration Services (SSIS).
- Mendesain skema data **Star Schema** untuk optimasi analitik OLAP.
- Menghasilkan visualisasi interaktif menggunakan **Power BI** dan **SSRS**.
- Mendukung pengambilan keputusan bisnis berbasis data.

## 🧭 Ruang Lingkup

- Pengumpulan dan staging data dari berbagai sumber ke **Bronze Layer**
- Transformasi, pembersihan, dan integrasi data ke **Silver Layer**
- Penyusunan data terstruktur berbasis **Star Schema** di **Gold Layer**
- Analisis segmentasi pelanggan, pembatalan reservasi, performa kamar, dan tren musiman
- Visualisasi data dalam bentuk dashboard dan laporan interaktif

## 🏨 Studi Kasus: Demond Stay Group

Perusahaan fiktif yang mengelola **Demand City Hotel** dan **Demand Resort Hotel**. Fokus utama:
- Pemanfaatan data pelanggan dan reservasi untuk meningkatkan efisiensi operasional
- Strategi harga dinamis, program loyalitas, dan analisis permintaan musiman

## 🛠 Teknologi & Tools

- **SQL Server Management Studio (SSMS)**
- **SQL Server Data Tools (SSDT)**
- **SQL Server Integration Services (SSIS)**
- **SQL Server Reporting Services (SSRS)**
- **Power BI** (Dashboard Visualisasi)
- **Format Data:** CSV, JSON, Excel
- **Format Storage:** Apache Parquet (untuk performa analitik optimal)

## 📐 Arsitektur Sistem

Menggunakan pendekatan **Medallion Architecture**:

1. **Bronze Layer:** Menyimpan data mentah dari berbagai sumber (CSV, JSON, Excel)
2. **Silver Layer:** Menyimpan data yang telah dibersihkan dan tervalidasi (format Parquet)
3. **Gold Layer:** Menyimpan data terstruktur siap analisis berbasis skema bintang (*Star Schema*)

## 🗃 Skema Data (Star Schema)

- **Tabel Fakta:**
  - `FactBooking`: Data reservasi dan transaksi

- **Tabel Dimensi:**
  - `DimCustomer`: Informasi pelanggan
  - `DimDate`: Informasi waktu dan musim
  - `DimHotel`: Informasi hotel
  - `DimRoom`: Informasi tipe kamar
  - `DimCountry`: Informasi geografis pelanggan

## 📊 Visualisasi & Analitik

- Dashboard Power BI:
  - Segmentasi pelanggan loyal
  - Analisis performa kamar berdasarkan musim
  - Tingkat pembatalan per saluran pemesanan
  - Revenue & occupancy rate

## 🧩 Evaluasi & Rencana Pengembangan

**Keberhasilan:**
- Sistem berhasil mengintegrasikan data operasional hotel dan mendukung analisis data historis dan real-time

**Tantangan:**
- Keterbatasan data sumber (satu dataset)
- Kompleksitas transformasi saat proses ETL

**Pengembangan ke depan:**
- Integrasi data real-time (streaming)
- Penambahan dimensi musiman dan event
- Automasi ETL dan CDC
- Modul prediksi perilaku tamu (ML)
- Penguatan sistem keamanan dan audit
- Dashboard adaptif untuk manajemen hotel

## 🔗 Link Dataset

[📁 Klik untuk mengakses dataset (Google Drive)](https://drive.google.com/drive/folders/1zggjDmz0dMsSoUHtLcN2jI1yqRf_HG5_?usp=sharing)

## 👥 Anggota Kelompok 12

- Muhammad Hanif Faros – 121450048  
- Jaclin Alcavella – 122450015  
- Elok Fiola – 122450051  
- Febiya Jomy Pratiwi – 122450074  
- Rut Junita Sari Siburian – 122450103  
- Elisabeth Claudia S. – 122450123

---

> Untuk detail lengkap, silakan lihat dokumen laporan akhir proyek.
