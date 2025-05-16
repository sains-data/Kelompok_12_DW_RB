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

