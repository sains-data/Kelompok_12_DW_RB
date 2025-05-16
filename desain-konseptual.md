## 🏨 Profil Bisnis

Sektor pariwisata tidak hanya meliputi tempat destinasi, tetapi juga mencakup berbagai layanan yang berhubungan dengan perjalanan seperti tempat tinggal atau penginapan, akomodasi, makanan, dan layanan lainnya. Industri pariwisata ini sangat erat kaitannya dengan sektor **hospitality**, dan keberlanjutannya perlu dianalisis secara berkala untuk mempertahankan eksistensinya.

Setiap data yang dihasilkan dalam proses bisnis sangatlah berharga, oleh karena itu perlu dibuat sebuah **gudang penyimpanan data (Data Warehouse)** yang baik agar data tersebut mudah digunakan kembali untuk analisis dan pengambilan keputusan.

Saat ini, proses pemesanan kamar hotel terkadang tidak dapat diatasi dengan baik oleh pihak manajemen hotel, yang menyebabkan berbagai masalah bisnis, seperti:

- Kurangnya sistem manajemen data yang efektif untuk memantau pembatalan pesanan secara menyeluruh
- Tidak adanya analisis permintaan kamar berdasarkan **musim atau waktu tertentu**
- Ketidakmampuan hotel dalam memberikan layanan ekstra untuk pelanggan loyal karena tidak adanya pemahaman terhadap **segmentasi pasar**

Melalui proyek ini, sistem data warehouse akan membantu mengelola, menyimpan, dan menganalisis data reservasi dan pelanggan, sehingga hotel dapat meningkatkan **layanan, strategi promosi, dan efisiensi operasional**.

 ## 📋 Daftar Departemen & Tujuan Bisnis

| No | Departemen                     | Tujuan Bisnis                                                                                                                                                  |
|----|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1  | Reservasi dan Pemesanan        | Meningkatkan tingkat konversi reservasi dengan memahami pola pembatalan dan sumber pemesanan (online travel agent, direct, corporate).                        |
| 2  | *Front Office*                 | Mengoptimalkan proses check-in dan check-out dengan memprediksi waktu kedatangan dan lama tinggal tamu.                                                       |
| 3  | Keuangan dan Pendapatan        | Memaksimalkan pendapatan dengan analisis tren harga kamar, ADR (*Average Daily Rate*), dan pendapatan berdasarkan musim dan segmentasi pasar.                |
| 4  | Manajemen Operasional Hotel    | Menyusun perencanaan staf dan logistik yang efisien berdasarkan tingkat okupansi, jenis kamar, dan distribusi waktu hunian.                                   |
| 5  | Pemasaran                      | Menyusun kampanye promosi yang lebih efektif berdasarkan analisis segmentasi pelanggan dan asal negara pelanggan.                                            |
| 6  | *Customer Experience*          | Meningkatkan kepuasan pelanggan dengan menganalisis review, alasan pembatalan, dan preferensi kamar atau meal.                                                |
| 7  | *Housekeeping*                 | Menyusun jadwal kebersihan dan perawatan kamar yang lebih efisien berdasarkan durasi menginap dan rotasi hunian.                                             |


## 📊 Fakta dan Dimensi

### a. Fakta (*Measures*)
- Jumlah pemesanan (`booking_count`)
- Jumlah pembatalan (`cancellation_count`)
- Tingkat pembatalan (`cancellation_rate`)
- Jumlah tamu (`total_guests`)
- Lama menginap (`stay_total_nights`)
- Pendapatan (`revenue`)
- Jumlah permintaan khusus (`total_of_special_requests`)
- Jumlah hari menunggu (`lead_time`)

### b. Dimensi

#### 1. Waktu
- Tahun pemesanan (`arrival_date_year`)
- Bulan pemesanan (`arrival_date_month`)
- Hari pemesanan (`arrival_date_day_of_month`)
- Musim (berdasarkan bulan)
- `Weekend`
- `Weekday`

#### 2. Hotel
- Jenis hotel (`hotel_resort_city`)
- Negara hotel (`hotel_country`)

#### 3. Tamu
- Tipe tamu (`customer_type`)
- Negara asal tamu (`country`)
- Status tamu berulang (`is_repeated_guest`)
- Tipe deposit (`deposit_type`)

#### 4. Pemesanan
- Segmen pasar (`market_segment`)
- Saluran distribusi (`distribution_channel`)
- Status pembatalan (`is_canceled`)
- Jenis kamar (`reserved_room_type`)
- Jenis kamar yang dialokasikan (`assigned_room_type`)

#### 5. Perencanaan
- Periode pemesanan (`lead_time`)
- Waiting list (`waiting_list`)


## 🧩 Dimensi Schema (Star Schema)

### 🌟 Tabel Fakta: `fact_bookings`
Berisi data utama pemesanan yang menjadi pusat analisis.

| Kolom                | Keterangan                    |
|----------------------|-------------------------------|
| booking_id           | ID pemesanan (PK)             |
| date_id              | FK ke dim_date                |
| hotel_id             | FK ke dim_hotel               |
| customer_id          | FK ke dim_customer            |
| booking_dim_id       | FK ke dim_booking             |
| planning_id          | FK ke dim_planning            |
| total_guests         | Jumlah tamu                   |
| stay_total_nights    | Lama menginap                 |
| revenue              | Pendapatan                    |
| special_request_count| Jumlah permintaan khusus      |
| lead_time_days       | Jumlah hari menunggu          |
| is_canceled          | Status pembatalan             |

---

### 📅 `dim_date`
Informasi waktu dan kalender.

| Kolom       | Keterangan         |
|-------------|--------------------|
| id          | ID tanggal (PK)    |
| year        | Tahun              |
| month       | Bulan              |
| day         | Hari               |
| season      | Musim              |
| is_weekend  | Weekend/Weekday    |

---

### 🏨 `dim_hotel`
Informasi terkait hotel.

| Kolom        | Keterangan          |
|--------------|---------------------|
| id           | ID hotel (PK)       |
| hotel_type   | Jenis hotel         |
| hotel_country| Negara hotel        |

---

### 👤 `dim_customer`
Detail tamu/pelanggan.

| Kolom          | Keterangan              |
|----------------|--------------------------|
| id             | ID pelanggan (PK)        |
| customer_type  | Tipe tamu                |
| country        | Negara asal              |
| is_repeated_guest | Apakah pelanggan loyal |
| deposit_type   | Tipe deposit             |

---

### 📦 `dim_booking`
Detail pemesanan dan distribusi.

| Kolom             | Keterangan                   |
|-------------------|------------------------------|
| id                | ID booking_dim (PK)          |
| market_segment    | Segmen pasar                 |
| distribution_channel | Saluran distribusi        |
| reserved_room_type   | Jenis kamar dipesan       |
| assigned_room_type   | Jenis kamar dialokasikan  |
| waiting_list         | Status waiting list       |

---

### 📋 `dim_planning`
Informasi perencanaan tamu.

| Kolom              | Keterangan                  |
|--------------------|-----------------------------|
| id                 | ID planning (PK)            |
| lead_time          | Jarak hari pemesanan        |
| total_of_special_requests | Jumlah permintaan khusus |

---

**Gambar 1.** Model ini menggunakan **Star Schema**, dengan `fact_bookings` sebagai pusat dan enam tabel dimensi yang saling terhubung melalui foreign key.


## 🧩 Gambar 1. Dimensi Schema

Struktur skema multidimensi dalam *Data Warehouse* industri pariwisata dan *hospitality* dirancang untuk memudahkan analisis pemesanan hotel dari berbagai sudut pandang.

- **dim_date** mencakup elemen waktu seperti tahun, bulan, hari, musim, dan akhir pekan, yang berguna untuk mengamati tren musiman dan perilaku pemesanan harian.
- **dim_hotel** menyimpan informasi tentang jenis dan lokasi hotel, yang berguna untuk menganalisis kinerja berdasarkan tipe dan segmen hotel.
- **dim_customer** menggambarkan karakteristik pengunjung, termasuk jenis pelanggan, negara asal, status pelanggan berulang, dan jenis deposit, yang membantu dalam segmentasi serta loyalitas pelanggan.
- **dim_booking** mencakup informasi tentang pemesanan seperti segmen pasar, saluran distribusi, jenis kamar, dan status daftar tunggu, yang penting untuk strategi penjualan dan alokasi kamar.
- **dim_planning** berisi data perencanaan tamu, seperti waktu tunggu dan jumlah permintaan khusus, yang mendukung operasi serta manajemen layanan.

---

## 📚 4. Sumber Data dan Metadata

### a. Sumber Data
Data berasal dari dataset yang tersedia di Kaggle dengan judul [“Hotel Booking Demand”](https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand). Dataset ini berisi **119.390 observasi** untuk sebuah Hotel Kota dan Hotel Resort.

Setiap observasi merepresentasikan satu pemesanan hotel antara tanggal **1 Juli 2015 hingga 31 Agustus 2017**, termasuk pemesanan yang benar-benar terealisasi maupun yang dibatalkan.

### b. Metadata

#### 📊 Tabel 2. Metadata

| **Nama Kolom**                   | **Tipe Data** | **Deskripsi**                                                  |
|----------------------------------|---------------|----------------------------------------------------------------|
| Hotel                            | STRING        | Tipe Hotel                                                     |
| Is_canceled                      | INTEGER       | Reservasi Dibatalkan (1/0)                                     |
| Lead_time                        | INTEGER       | Jumlah Hari Pemesanan                                          |
| Arrival_date_year                | INTEGER       | Tahun Kedatangan                                               |
| Arrival_date_month               | STRING        | Bulan Kedatangan                                               |
| Arrival_date_week                | INTEGER       | Minggu Kedatangan                                              |
| Arrival_date_day                 | INTEGER       | Hari Kedatangan                                                |
| Market_segment                   | OBJECT        | Segmen Pasar Pemesanan                                         |
| Distribution_channel             | OBJECT        | Saluran Distribusi Pemesanan                                   |
| Is_repeated_guest                | INTEGER       | Tamu yang pernah menginap sebelumnya                           |
| Previous_cancellations           | INTEGER       | Jumlah Pembatalan Reservasi Sebelumnya                         |
| Previous_bookings_not_canceled  | INTEGER       | Jumlah reservasi sebelumnya yang tidak dibatalkan              |
| Reserved_room_type               | OBJECT        | Tipe Kamar Yang Dipesan                                        |
| Booking_changes                  | INTEGER       | Jumlah Perubahan Pada Reservasi                                |
| Deposit_type                     | OBJECT        | Tipe Deposit                                                   |
| Agent                            | INTEGER       | ID Agen Pemesanan                                              |
| Company                          | INTEGER       | ID Perusahaan Pemesanan                                        |
| Days_in_waiting_list            | INTEGER       | Jumlah Hari di Daftar Tunggu                                   |
| Customer_type                    | OBJECT        | Tipe Pelanggan                                                 |
| Adr                              | FLOAT         | Rata-rata Harga Harian Per Kamar                               |


## 📚 Referensi

1. Antonio, N., Almeida, A., & Nunes, L. (2019). Hotel booking demand datasets. *Data in Brief, 22*, 41–49. [https://doi.org/10.1016/j.dib.2018.11.126](https://doi.org/10.1016/j.dib.2018.11.126)
