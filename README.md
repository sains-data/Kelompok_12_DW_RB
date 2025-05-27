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
- 
## 🛠 Metode Pengembangan
![Metode Waterfall](https://drive.google.com/uc?export=view&id=1Br6dyLUMk6mjkoSGgQEvGYstwffgccas)
Proyek ini menggunakan pendekatan **Waterfall**, melalui empat tahapan utama (misi 1–4):

1. Requirements Definition  
2. System and Software Design  
3. Implementation and Unit Testing  
4. Integration and System Testing  
5. Operation and Maintenance

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
![Arsitektur Sistem](https://drive.google.com/uc?export=view&id=1w0M2MfaKyQzqr0zGV0LJcRJfBadzhBXi)
1. **Bronze Layer:** Menyimpan data mentah dari berbagai sumber (CSV, JSON, Excel)
2. **Silver Layer:** Menyimpan data yang telah dibersihkan dan tervalidasi (format Parquet)
3. **Gold Layer:** Menyimpan data terstruktur siap analisis berbasis skema bintang (*Star Schema*)

## 🗃 Skema Data (Star Schema)

- **Tabel Fakta:**
  - `FactBooking`: Data reservasi dan transaksi

| Kolom                 | Tipe Data       | Keterangan                                                                 |
|-----------------------|-----------------|-----------------------------------------------------------------------------|
| Booking_ID            | INT             | Kunci unik untuk setiap reservasi.                                          |
| Customer_Key          | INT             | Kunci asing ke tabel DimCustomer.                                           |
| Date_Key              | DATE            | Kunci asing ke tabel DimDate (tanggal check-in).                           |
| Hotel_Key             | INT             | Kunci asing ke tabel DimHotel.                                              |
| Room_Key              | INT             | Kunci asing ke tabel DimRoom.                                               |
| Country_Key           | INT             | Kunci asing ke tabel DimCountry (negara asal pelanggan).                   |
| Is_Canceled           | BOOLEAN         | Indikator apakah reservasi dibatalkan (TRUE/FALSE).                        |
| Lead_Time             | INT             | Jumlah hari antara tanggal pemesanan dan check-in.                          |
| Stay_Total_Nights     | INT             | Total durasi menginap (malam).                                              |
| Total_Guests          | INT             | Jumlah tamu (dewasa, anak-anak, bayi).                                      |
| Revenue               | DECIMAL(18,2)   | Pendapatan total dari reservasi.                                            |
| Total_of_Special_Requests | INT         | Jumlah permintaan khusus (parkir, ranjang tambahan, dll).                   |
| Assigned_Room_Type    | VARCHAR(20)     | Tipe kamar sebenarnya yang dialokasikan.                                    |

---

- **Tabel Dimensi:**
  - `DimCustomer`: Informasi pelanggan
    | Kolom               | Tipe Data      | Deskripsi                                          |
    |---------------------|----------------|----------------------------------------------------|
    | Customer_Key        | INT            | Kunci unik untuk setiap pelanggan.                 |
    | Customer_Type       | VARCHAR(50)    | Jenis pelanggan (Individual, Group).               |
    | Is_Repeated_Guest   | BOOLEAN        | Apakah pelanggan adalah tamu berulang.             |
    | Market_Segment      | VARCHAR(50)    | Segmen pasar (Online TA, Corporate, dll).          |
    | Distribution_Channel| VARCHAR(50)    | Saluran distribusi (GDS, Direct, dll).             |
    | Deposit_Type        | VARCHAR(50)    | Tipe deposit untuk reservasi.                      |
    | Waiting_List        | BOOLEAN        | Apakah reservasi pernah masuk daftar tunggu.       |

---
  - `DimDate`: Informasi waktu dan musim
    | Kolom        | Tipe Data     | Deskripsi                                        |
    |--------------|---------------|--------------------------------------------------|
    | Date_Key     | DATE          | Tanggal unik (check-in).                         |
    | Day          | INT           | Hari dalam bulan (1–31).                         |
    | Month        | INT           | Bulan dalam tahun (1–12).                        |
    | Quarter      | INT           | Kuartal (1–4).                                   |
    | Year         | INT           | Tahun.                                           |
    | Season       | VARCHAR(20)   | Musim (Musim Panas, Musim Dingin, dll).         |
    | Is_Week_End  | BOOLEAN       | Apakah tanggal adalah akhir pekan.              |

---
  - `DimHotel`: Informasi hotel
  |  Kolom          | Tipe Data     | Deskripsi                                          |
  |----------------|---------------|----------------------------------------------------|
  | Hotel_Key      | INT           | Kunci unik untuk setiap hotel.                     |
  | Hotel_Type     | VARCHAR(50)   | Jenis hotel (City Hotel, Resort Hotel).            |
  | Hotel_Country  | VARCHAR(50)   | Negara lokasi hotel.                               |

---
  - `DimRoom`: Informasi tipe kamar
    | Kolom               | Tipe Data     | Deskripsi                                |
    |---------------------|---------------|------------------------------------------|
    | Room_Key            | INT           | Kunci unik untuk setiap tipe kamar.       |
    | Reserved_Room_Type  | VARCHAR(20)   | Tipe kamar yang dipesan oleh pelanggan.  |

---
  - `DimCountry`: Informasi geografis pelanggan
    | Kolom        | Tipe Data       | Deskripsi                                    |
    |--------------|------------------|----------------------------------------------|
    | Country_Key  | INT              | Kunci unik untuk setiap negara.              |
    | Country_Name | VARCHAR(100)     | Nama lengkap negara asal pelanggan.         |
    | Region       | VARCHAR(100)     | Wilayah geografis (misalnya, Asia, Eropa).  |

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
