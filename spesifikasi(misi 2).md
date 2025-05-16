# 📈 Bagian 1: Analisis Kebutuhan Informasi Bisnis

## 1.1 Tentang Bisnis

Industri perhotelan merupakan bagian vital dari sektor pariwisata yang dipengaruhi oleh berbagai dinamika eksternal seperti musim liburan, tren wisatawan, dan regulasi pemerintah. Untuk tetap kompetitif, hotel harus adaptif dalam menghadapi variasi permintaan dan pola pemesanan yang kompleks dari berbagai saluran, baik online maupun konvensional. Selain layanan prima, pengelolaan data yang efektif menjadi kunci dalam menyusun strategi bisnis yang berbasis informasi. Interaksi pelanggan, preferensi musiman, dan tren pasar dapat menjadi aset strategis jika dianalisis dengan tepat.

Sayangnya, banyak data belum diolah secara optimal, sehingga kurang mendukung pengambilan keputusan. Data warehouse hadir sebagai solusi untuk mengintegrasikan dan merangkum data dari berbagai sumber menjadi informasi yang relevan. Dalam konteks ini, data warehouse berperan sebagai fondasi arsitektur analitik yang memungkinkan efisiensi, personalisasi layanan, prediksi tren permintaan, serta pengelolaan sumber daya secara efektif. Oleh karena itu, perancangan arsitektur data warehouse menjadi langkah penting dalam transformasi digital dan peningkatan daya saing sektor hospitality.

## 1.2 Kebutuhan Informasi / Permasalahan

- Belum ada pengklasifikasian saluran pemesanan yang menghasilkan pesanan yang berkualitas (tanpa pembatalan).
- Kurangnya permintaan tipe kamar yang sesuai dengan musim yang berganti-ganti.
- Belum adanya penerapan pelayanan ekstra untuk pelanggan yang sering menginap karena tidak ada analisis segmentasi pelanggan.

## 1.3 Kebutuhan Teknis

- Sistem penyimpanan yang mendukung query cepat dan agregasi data historis.
- Struktur data yang mudah untuk digunakan pada BI tools (misal Power BI / Tableau).
- Kebutuhan analisis dimensi waktu, negara, tipe pelanggan, dan tipe kamar.

## 1.4 Pihak yang Membutuhkan

- **Tim Reservasi dan Resepsionis**: untuk melihat dan memisahkan pelanggan lama yang sering bertransaksi berdasarkan saluran.
- **Manajer Revenue**: untuk melihat tipe kamar apa yang paling banyak diminati di musim tertentu.
- **Tim Loyalty / CRM**: untuk melihat siapa pelanggan yang sering kembali dan memberikan kontribusi tinggi untuk diberi reward atau penawaran khusus.
- **Manajer Hotel**: untuk mengetahui efektivitas alokasi pelayanan pelanggan VIP.
 

# 📐 Bagian 2: Skema Konseptual Multidimensi

## 2.1 Star Schema

Model star schema yang digunakan memiliki satu tabel fakta utama (`fact_booking`) yang dikelilingi oleh beberapa tabel dimensi seperti:

- `dim_customer`
- `dim_date`
- `dim_hotel`
- `dim_country`
- `dim_room`

Diagram skemanya dapat dilihat pada gambar berikut:

![Dimensi Schema](./src/star_schema_diagram.png) <!-- Ganti path jika file gambar di-upload -->

## 2.2 Dasar Skema dan Penerapan

Pada misi ini menggunakan rancangan arsitektur **star schema** karena tidak perlu dinormalisasi, yang terdiri dari tabel utama sebagai fakta dan beberapa tabel dimensi yang berguna untuk menjelaskan rincian dari setiap pemesanan hotel. Tabel-tabel seperti `Date`, `Customer`, `Hotel`, `Country`, dan `Room` dikategorikan sebagai tabel dimensi karena masing-masing menyimpan informasi yang menjelaskan konteks terhadap data utama yang tercatat di tabel fakta.

Tabel-tabel dimensi ini tidak fokus pada transaksi, melainkan menjelaskan siapa, apa, dan dimana dari sebuah peristiwa bisnis, dalam hal ini adalah proses pemesanan hotel. `Dimensi Date` menyajikan konteks waktu yang dibutuhkan untuk analisis tren waktu. `Dimensi Customer` menyimpan karakteristik pelanggan seperti tipe pelanggan, asal negara, dan status berulang. `Dimensi Hotel` menjelaskan informasi mengenai jenis dan lokasi hotel, sementara `Dimensi Country` menjelaskan asal negara pelanggan. Sedangkan `Dimensi Room` memberikan informasi tentang jenis kamar yang dipesan dan yang dialokasikan.

Semua tabel dimensi ini berperan penting dalam mendukung proses analitik data, pelaporan, dan pengambilan keputusan yang berbasis data (*data-driven*), dengan memberikan konteks yang memperkaya interpretasi data dalam tabel fakta.
# 📊 Bagian 3: Penjelasan Tiap Komponen

## 3.1 Tabel Fakta

Tabel fakta yang digunakan dalam arsitektur *star schema* ini adalah `fact_bookings`, yang berperan sebagai pusat utama dalam sistem *data warehouse*. Tabel ini menggabungkan berbagai nilai kuantitatif yang dapat dianalisis secara multidimensi dan berfungsi sebagai jembatan antara tabel dimensi lainnya.

Data numerik dari aktivitas pemesanan hotel berkaitan langsung dengan pengambilan keputusan strategis, terutama yang berkaitan dengan efektivitas saluran pemesanan, preferensi pelanggan, dan segmentasi pelanggan. Adapun atribut utama yang terdapat pada Tabel `fact_bookings` antara lain:

- `booking_id`: ID unik dari setiap transaksi pemesanan.
- `is_canceled`: status pembatalan pemesanan (1 jika dibatalkan, 0 jika tidak).
- `lead_time`: jumlah hari antara tanggal pemesanan dan tanggal kedatangan.
- `stay_total_nights`: total jumlah malam menginap (*weekday* dan *weekend*).
- `total_guests`: jumlah total tamu dalam satu pemesanan (dewasa, anak-anak, bayi).
- `revenue`: estimasi pendapatan yang dihasilkan dari pemesanan.
- `total_of_special_requests`: jumlah permintaan khusus yang diajukan pelanggan.

**Foreign Key** yang menghubungkan ke tabel dimensi:

- `hotel_key`: menghubungkan ke `dim_hotel`
- `date_key`: menghubungkan ke `dim_date`
- `customer_key`: menghubungkan ke `dim_customer`
- `room_key`: menghubungkan ke `dim_room` (informasi tipe kamar)
- `country_key`: menghubungkan ke `dim_country` (asal negara pelanggan)
## 3.2 Tabel Dimensi

Dalam suatu arsitektur *star schema*, tabel dimensi berperan penting untuk memberikan penjelasan terhadap atribut deskriptif dari tabel fakta yang tersimpan dalam tabel utama (`fact_bookings`). Pada dataset yang digunakan, terdapat 5 tabel dimensi yang digunakan dalam rancangan yang dilakukan:

### a. `dim_date`
Tabel ini digunakan untuk memberikan waktu terhadap pemesanan, sehingga tabel ini sangat berguna dalam melakukan analisis tren musiman dan performa berdasarkan bulan/tahun, serta perbedaan pola pemesanan antara hari kerja dan akhir pekan.  
Adapun atribut yang digunakan, yaitu:  
- `date_key` (**primary key**)  
- `day`, `month`, `quarter`, `year`, `season`, `is_weekend`

### b. `dim_customer`
Tabel ini digunakan untuk menyimpan informasi terkait profil pelanggan dan saluran pemesanan. Informasi ini sangat penting untuk melakukan analisis segmentasi pelanggan dan evaluasi efektivitas distribusi.  
Adapun atribut yang digunakan, yaitu:  
- `customer_key` (**primary key**)  
- `country`, `customer_type`, `is_repeated_guest`, `market_segment`, `distribution_channel`, `deposit_type`, dan `waiting_list`

### c. `dim_hotel`
Tabel ini digunakan untuk mendeskripsikan tipe hotel dan lokasi umum yang berkaitan dengan pemesanan.  
Adapun atribut yang digunakan, yaitu:  
- `hotel_key` (**primary key**)  
- `hotel_type`, dan `hotel_country`

### d. `dim_room`
Tabel ini digunakan untuk menjelaskan informasi mengenai tipe kamar yang dipesan dan yang diberikan kepada pelanggan. Sehingga dapat digunakan untuk menganalisis preferensi pelanggan serta efektivitas manajemen kamar.  
Adapun atribut yang digunakan, yaitu:  
- `room_key` (**primary key**)  
- `reserved_room_type`, dan `assigned_room_type`
# 📌 Bagian 4: Justifikasi Desain Konseptual

## 4.1 Alasan Pemilihan Skema

Pada misi ini menggunakan *star schema* dipilih karena lebih simpel sesuai dengan karakteristik data dan kebutuhan analisis pada dataset *Hotel Booking Demand*. Struktur ini sederhana dan mudah dipahami karena hanya terdiri dari satu tabel fakta yang terhubung langsung ke beberapa dimensi, sehingga memudahkan analisis oleh end-user. 

Dengan dimensi yang tidak dinormalisasi, query menjadi lebih cepat dan efisien ideal untuk analisis pemesanan, pembatalan, dan segmentasi pelanggan. Mengingat data hotel cukup kompleks dan banyak mencakup sub domain, star schema juga menyediakan kerangka dasar untuk pelaporan, menjadikannya pilihan yang tepat untuk menjawab permasalahan saluran pemesanan, permintaan musiman kamar, dan pelayanan pelanggan loyal.

## 4.2 Kesesuaian Data dan Dimensi

Misi ini membahas tiga permasalahan utama: efektivitas saluran pemesanan, permintaan pelanggan, dan segmentasi pelanggan. Untuk menjawabnya digunakan skema bintang, di mana tabel fakta menyimpan nilai kuantitatif, dan tabel dimensi menyimpan data deskriptif yang menjelaskan konteks transaksi. 

Misalnya atribut `is_canceled` dan `revenue` pada tabel fakta dapat dihitung rasio pembatalan dan dinilai kualitas pemesanan. Permasalahan efektivitas saluran pemesanan dianalisis melalui dimensi yang relevan seperti `market_segment`, `distribution_channel`, dan `deposit_type`, sehingga dapat diketahui saluran mana yang menghasilkan pemesanan berkualitas maupun yang sering dibatalkan.

Permasalahan kurangnya permintaan tipe kamar sesuai musim dapat dianalisis secara efisien dengan bantuan dimensi `room`, `date`, dan tabel fakta. Atribut `reserved_room_type` dan `assigned_room_type` pada `dim_room` membantu mengidentifikasi perbedaan antara kamar yang dipesan dan yang diberikan, sehingga bisa mendeteksi ketidaksesuaian permintaan atau keterbatasan stok. `Dim_date` menyediakan atribut seperti `season`, dan `is_weekend` untuk menganalisis tren musiman pemesanan kamar.

Sedangkan tabel fakta menunjukkan perhitungan jumlah pemesanan dan analisis pendapatan (`revenue`) per tipe kamar pada setiap musim. Analisis ini penting untuk mengoptimalkan strategi alokasi dan promosi kamar sesuai permintaan.

# 📂 Bagian 5: Kesesuaian dengan Sumber Data

Berdasarkan sumber data historis pemesanan hotel yang mencakup informasi terkait pelanggan, pemesanan, dan pendapatan, rancangan *star schema* yang digunakan telah mencerminkan kebutuhan informasi secara menyeluruh. Sumber data utama berasal dari sistem manajemen pemesanan hotel (Property Management System), sistem Customer Relationship Management (CRM), serta data tambahan dari portal pemesanan daring (OTA) yang mencatat asal negara, saluran pemesanan, dan tipe kamar.

Atribut seperti `booking_id`, `lead_time`, `revenue`, dan `is_canceled` sesuai dengan kebutuhan kuantitatif dan dapat langsung dimasukkan ke dalam Tabel `fact_bookings`.

Sementara itu, atribut deskriptif seperti `market_segment`, `distribution_channel`, `customer_type`, `reserved_room_type`, dan `assigned_room_type` tersedia dalam data operasional dan cocok dimasukkan ke dalam Tabel Dimensi, khususnya `dim_customer` dan `dim_room`.

Demikian pula, data waktu (tanggal pemesanan, *check-in*, *check-out*) yang ada dalam sistem operasional dapat dimanfaatkan dalam `dim_date` yang menyimpan informasi waktu secara terstruktur (hari, bulan, musim, weekend, dan lainnya).

Struktur dan atribut yang tersedia telah mendukung pembangunan *data warehouse* dengan pendekatan skema bintang, memudahkan integrasi, mempercepat query, dan kompatibel dengan dashboard analitik seperti BI Tableau. Hal ini menunjukkan bahwa rancangan data warehouse yang dibuat telah sesuai dengan sumber data yang tersedia, kebutuhan analisis, serta selaras dengan tujuan strategis bisnis hotel.
