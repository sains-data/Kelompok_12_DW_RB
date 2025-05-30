# 📦 Proyek Data Warehouse - Industri Pariwisata & Hospitality

![Platform](https://img.shields.io/badge/Platform-SQL%20Server-blue)
![SSMS](https://img.shields.io/badge/Tool-SSMS-lightgrey)
![SSDT](https://img.shields.io/badge/Tool-SSDT-lightgrey)
![ETL](https://img.shields.io/badge/ETL-SSIS-informational)
![Reporting](https://img.shields.io/badge/Reporting-SSRS-orange)
![Visualization](https://img.shields.io/badge/BI-Power%20BI-yellow)
![Data%20Format](https://img.shields.io/badge/Data_CSV%2FJSON%2FExcel-brightgreen)
![Storage](https://img.shields.io/badge/Storage-Apache%20Parquet-blueviolet)
![Status](https://img.shields.io/badge/Project-Final-green)

Repositori ini merupakan dokumentasi proyek tugas besar dari mata kuliah **Pergudangan Data - Sains Data** di **Institut Teknologi Sumatera (ITERA)**. Proyek ini berfokus pada **perancangan dan implementasi data warehouse** untuk sektor pariwisata dan hospitality, dengan studi kasus perusahaan fiktif *Demond Stay Group*.

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

Perusahaan fiktif yang menaungi:
- **Demand City Hotel**
- **Demand Resort Hotel**

Fokus utama:
- Meningkatkan efisiensi operasional hotel berbasis analitik data
- Strategi harga dinamis & manajemen permintaan musiman
- Program loyalitas pelanggan berbasis segmentasi

## 🛠 Metode Pengembangan
![Metode Waterfall](https://drive.google.com/uc?export=view&id=1Br6dyLUMk6mjkoSGgQEvGYstwffgccas)
> **Gambar 1.** Tahapan metode Waterfall yang digunakan dalam pengembangan proyek.
Proyek ini menggunakan pendekatan **Waterfall**, melalui empat tahapan utama (misi 1–4):

| Tahap                         | Penjelasan Singkat                                                                 |
|------------------------------|------------------------------------------------------------------------------------|
| 1. Requirements Definition    | Mengumpulkan kebutuhan sistem dan menganalisis masalah bisnis hotel.              |
| 2. System and Software Design| Merancang arsitektur data warehouse, skema data, dan alur ETL.                    |
| 3. Implementation and Unit Testing | Membangun pipeline ETL, membuat tabel fakta/dimensi, dan menguji komponen.     |
| 4. Integration and System Testing | Menggabungkan seluruh komponen dan menguji hasil akhir visualisasi & query.   |
| 5. Operation and Maintenance | Menyempurnakan sistem, dokumentasi, serta menyiapkan pengembangan ke depan.       |


## 🛠 Teknologi & Tools

| Teknologi / Tools                        | Fungsi                                                                 |
|-----------------------------------------|------------------------------------------------------------------------|
| **SQL Server Management Studio (SSMS)** | Manajemen database dan eksekusi query SQL                             |
| **SQL Server Data Tools (SSDT)**        | Desain dan deployment proyek database serta paket SSIS/SSRS           |
| **SQL Server Integration Services (SSIS)** | Pengembangan pipeline ETL untuk ekstraksi, transformasi, dan pemuatan data |
| **SQL Server Reporting Services (SSRS)**| Membuat dan menyajikan laporan berbasis server                        |
| **Power BI**                            | Visualisasi interaktif dan dashboard analitik                          |
| **Format Data**: CSV, JSON, Excel       | Format awal data mentah pada Bronze Layer                             |
| **Format Storage**: Apache Parquet      | Format penyimpanan berbasis kolom untuk efisiensi analitik di Gold Layer |


## 📐 Arsitektur Sistem

Menggunakan pendekatan **Medallion Architecture**:
![Arsitektur Sistem](https://drive.google.com/uc?export=view&id=1w0M2MfaKyQzqr0zGV0LJcRJfBadzhBXi)
> **Gambar 2.** Arsitektur Medallion: Bronze, Silver, dan Gold Layer.
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

  - `DimHotel`: Informasi hotel
    
    | Kolom          | Tipe Data     | Deskripsi                                          |
    |----------------|---------------|----------------------------------------------------|
    | Hotel_Key      | INT           | Kunci unik untuk setiap hotel.                     |
    | Hotel_Type     | VARCHAR(50)   | Jenis hotel (City Hotel, Resort Hotel).            |
    | Hotel_Country  | VARCHAR(50)   | Negara lokasi hotel.                               |

  - `DimRoom`: Informasi tipe kamar
    | Kolom               | Tipe Data     | Deskripsi                                |
    |---------------------|---------------|------------------------------------------|
    | Room_Key            | INT           | Kunci unik untuk setiap tipe kamar.      |
    | Reserved_Room_Type  | VARCHAR(20)   | Tipe kamar yang dipesan oleh pelanggan.  |

  - `DimCountry`: Informasi geografis pelanggan
    | Kolom        | Tipe Data       | Deskripsi                                    |
    |--------------|------------------|----------------------------------------------|
    | Country_Key  | INT              | Kunci unik untuk setiap negara.              |
    | Country_Name | VARCHAR(100)     | Nama lengkap negara asal pelanggan.         |
    | Region       | VARCHAR(100)     | Wilayah geografis (misalnya, Asia, Eropa).  |

## 📁 Struktur Direktori Repositori

```plaintext
📦 data-warehouse-hospitality/
├── 📂 docs/
│   ├── laporan-akhir.pdf               # Dokumen laporan lengkap
│   ├── poster.pdf                      # Poster visual proyek
│   └── presentasi.pdf                  # Slide presentasi akhir
│
├── 📂 data/
│   ├── raw/                            # Data mentah (CSV, JSON, Excel)
│   │   └── hotel_booking_data.csv
│   ├── cleaned/                        # Data bersih dan siap analisis
│   └── dictionary.md                   # Deskripsi data dan definisi kolom
│
├── 📂 etl/
│   ├── ssis-package.dtsx               # Paket ETL menggunakan SSIS
│   ├── mapping-doc.md                  # Dokumen mapping ETL
│   └── sql-scripts/                    # Skrip SQL (DDL, DML, indexing)
│       ├── create_tables.sql
│       ├── insert_sample_data.sql
│       └── indexing.sql
│
├── 📂 model/
│   ├── star-schema.png                 # Diagram skema bintang
│   ├── medallion-architecture.png      # Diagram arsitektur Medallion
│   └── dataflow.png                    # Alur proses data dari sumber ke dashboard
│
├── 📂 dashboard/
│   ├── powerbi-report.pbix            # File Power BI (dashboard)
│   ├── dashboard-screenshots/         # Gambar dashboard
│   │   ├── loyal-customers.png
│   │   ├── seasonal-trends.png
│   │   └── cancellation-rate.png
│   └── dashboard-description.md       # Penjelasan tiap visualisasi
│
├── README.md                          # Dokumentasi utama proyek
└── LICENSE                            # Lisensi repositori (opsional)
````

## 📊 Visualisasi & Analitik

- Dashboard Power BI:
  - Segmentasi pelanggan loyal
  - Analisis performa kamar berdasarkan musim
  - Tingkat pembatalan per saluran pemesanan
  - Revenue & occupancy rate

## 🧩 Evaluasi & Rencana Pengembangan

**Keberhasilan:**
- Integrasi data operasional berjalan lancar
- Visualisasi mendukung pengambilan keputusan manajerial

**Tantangan:**
- Keterbatasan data sumber (satu dataset)
- Kompleksitas transformasi saat proses ETL

**Pengembangan ke depan:**
- Integrasi data real-time dengan Kafka atau Pub/Sub
- Penambahan dimensi event musiman & lokal
- Automasi ETL & CDC (Change Data Capture)
- Modul machine learning untuk prediksi perilaku tamu
- Audit data, enkripsi, dan RBAC
- Dashboard mobile untuk manajer hotel

## 🔗 Link Dataset

[📁 Klik untuk mengakses dataset (Google Drive)](https://drive.google.com/drive/folders/1zggjDmz0dMsSoUHtLcN2jI1yqRf_HG5_?usp=sharing)

## 👥 Anggota Kelompok 12

| No | Nama Lengkap                    | NIM         | Peran           |
|----|----------------------------------|-------------|------------------|
| 1  | Rut Junita Sari Siburian        | 122450103   | Ketua Kelompok   |
| 2  | Muhammad Hanif Faros            | 121450048   | Anggota          |
| 3  | Jaclin Alcavella                | 122450015   | Anggota          |
| 4  | Elok Fiola                      | 122450051   | Anggota          |
| 5  | Febiya Jomy Pratiwi             | 122450074   | Anggota          |
| 6  | Elisabeth Claudia S.            | 122450123   | Anggota          |


---
## 📑 Laporan Lengkap

Untuk melihat detail dari tugas besar kelompok kami, silakan lihat laporan lengkap pada tautan berikut:

👉 [Laporan Tugas Besar Data Warehouse Kelompok 12](https://github.com/sains-data/Kelompok_12_DW_RB/blob/142c2e2eb681a29df4e30d92b1c439072a4148f5/Laporan%20tugas%20Besar%20Data%20Warehouse%20Kelompok%2012.pdf)

🖼️ [Poster Data Warehouse](https://github.com/sains-data/Kelompok_12_DW_RB/blob/5cc90a2b97ad7df6b29cd6208ac54e20f2ea013f/Poster%20Data%20Warehouse%20KElompok%2012.pdf)
