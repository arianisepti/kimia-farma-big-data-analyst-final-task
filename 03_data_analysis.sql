-- Total pendapatan,laba bersih keseluruhan, dan Rata-Rata Rating Transaksi
SELECT
  SUM(nett_sales) AS total_pendapatan,
  SUM(nett_profit) AS total_laba_bersih,
  ROUND(AVG(rating_transaksi), 2) AS rata_rata_rating_transaksi
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_main_table`;


-- Top 10 Total transaksi cabang provinsi
SELECT provinsi, COUNT(DISTINCT transaction_id) AS total_transaksi
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_main_table`
GROUP BY provinsi
ORDER BY total_transaksi DESC
LIMIT 10;



-- Top 10 Nett sales cabang provinsi
SELECT
  provinsi,
  branch_name,
  SUM(nett_sales) AS total_nett_sales
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_main_table`
GROUP BY provinsi, branch_name
ORDER BY total_nett_sales DESC;




-- Total Profit Masing-masing Provinsi
SELECT
  provinsi,
  SUM(nett_profit) AS total_profit
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_main_table`
GROUP BY provinsi
ORDER BY total_profit DESC;



-- Perbandingan Pendapatan Kimia Farma dari tahun ke tahun
SELECT
  EXTRACT(YEAR FROM date) AS tahun,
  SUM(nett_sales) AS total_pendapatan
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_main_table`
GROUP BY tahun
ORDER BY tahun;


-- Top 5 Cabang Dengan Rating Tertinggi, namun Rating Transaksi Terendah
SELECT
  branch_id,
  branch_name,
  kota,
  provinsi,
  ROUND(AVG(rating_cabang), 2) AS avg_rating_cabang,
  ROUND(AVG(rating_transaksi), 2) AS avg_rating_transaksi
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_main_table`
GROUP BY branch_id, branch_name, kota, provinsi
HAVING AVG(rating_cabang) IS NOT NULL
   AND AVG(rating_transaksi) IS NOT NULL
ORDER BY avg_rating_cabang DESC, avg_rating_transaksi ASC
LIMIT 5;



-- Top 5 Kategori Produk berdasarkan Penjualan
SELECT
  product_category,
  SUM(nett_sales) AS total_penjualan
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_main_table`
GROUP BY product_category
ORDER BY total_penjualan DESC
LIMIT 5;





