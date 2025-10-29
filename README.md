💊 Tugas Akhir Big Data Analyst Kimia Farma
  Proyek akhir untuk Virtual Internship Experience – Kimia Farma Big Data Analyst oleh Rakamin Academy.

📂 Gambaran Proyek
  Proyek ini menganalisis kinerja bisnis Kimia Farma pada periode 2020–2023 menggunakan BigQuery dan Looker Studio.
Tujuannya adalah untuk memberikan insight dan rekomendasi strategis berdasarkan data transaksi, cabang, dan produk.

🧠 Tujuan
1. Melakukan pemeriksaan kualitas data pada beberapa tabel sumber.
2. Membuat tabel analisis terintegrasi (kf_main_table) menggunakan SQL join.
3. Menghasilkan insight bisnis utama seperti:
    - Total penjualan dan keuntungan
    - Cabang dan produk dengan performa terbaik
    - Tingkat kepuasan pelanggan (rating)
    - Tren pendapatan dari tahun ke tahun

🧰 Alat yang Digunakan
1. Google BigQuery — Pemrosesan data dan analisis SQL
2. Google Looker Studio — Visualisasi dan pembuatan dashboard
3. GitHub — Repositori untuk menyimpan skrip SQL dan dokumentasi

🧾 File SQL
1. 01_data_quality_check.sql -> Validasi data: nilai null, duplikasi, pengecekan numerik, produk yang hilang
2. 02_create_kf_main_table.sql -> SQL untuk membuat tabel utama terintegrasi (kf_main_table)
3. 03_bigquery_analysis.sql -> Kumpulan query analisis yang digunakan dalam visualisasi dashboard
   
📊 Dashboard Looker Studio

🔗 [Lihat Dashboard di Sini](https://lookerstudio.google.com/reporting/938a5cfa-9e4f-45b7-bff8-83d8bd395fbf)

🧩 Ringkasan Insight
1. Jawa Barat merupakan provinsi dengan performa tertinggi dalam hal penjualan dan keuntungan.
2. Rating transaksi pelanggan sedikit lebih rendah dibandingkan rating cabang (rata-rata 4,0).
3. Distribusi keuntungan antarprovinsi belum merata, menunjukkan peluang ekspansi di wilayah tertentu.
4. Tren penjualan berfluktuasi selama 2020–2023, menunjukkan perlunya strategi pemasaran dan perencanaan permintaan yang lebih baik.

💡 Rekomendasi
1. Perluas cabang di luar Pulau Jawa untuk menyeimbangkan distribusi transaksi.
2. Digitalisasi sistem transaksi guna meningkatkan pengalaman dan kepuasan pelanggan.
3. Diversifikasi kategori produk agar tidak bergantung pada obat dengan penjualan tertinggi saja.
4. Optimalkan rantai pasok dan manajemen stok di provinsi dengan keuntungan rendah.

👩‍💻 Penulis
Ariani Dwi Septi
Mahasiswa Informatika – Universitas Bhamada Slawi
Rakamin Academy – Virtual Internship  (Kimia Farma Big Data Analyst)
