-- Mengecek jumlah baris setiap tabel
SELECT COUNT(*) AS total_rows FROM `rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction`;
SELECT COUNT(*) AS total_rows FROM `rakamin-kf-analytics-475702.kimia_farma.kf_inventory`;
SELECT COUNT(*) AS total_rows FROM `rakamin-kf-analytics-475702.kimia_farma.kf_kantor_cabang`;
SELECT COUNT(*) AS total_rows FROM `rakamin-kf-analytics-475702.kimia_farma.kf_product`;



-- Cek 10 baris pertama tiap tabel
SELECT * FROM `rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction` LIMIT 10;
SELECT * FROM `rakamin-kf-analytics-475702.kimia_farma.kf_inventory` LIMIT 10;
SELECT * FROM `rakamin-kf-analytics-475702.kimia_farma.kf_kantor_cabang` LIMIT 10;
SELECT * FROM `rakamin-kf-analytics-475702.kimia_farma.kf_product` LIMIT 10;


-- Mengecek nilai NULL di kolom penting transaksi
SELECT
  SUM(CASE WHEN transaction_id IS NULL THEN 1 ELSE 0 END) AS null_transaction_id,
  SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
  SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS null_price,
  SUM(CASE WHEN branch_id IS NULL THEN 1 ELSE 0 END) AS null_branch_id,
  COUNT(*) AS total_rows
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction`;



-- Cek apakah kolom 'price' semuanya angka
SELECT
  COUNT(*) AS total_rows,
  COUNT(SAFE_CAST(price AS NUMERIC)) AS valid_numeric,
  COUNT(*) - COUNT(SAFE_CAST(price AS NUMERIC)) AS invalid_numeric
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction`;



-- Menampilkan contoh nilai non-numeric
SELECT price
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction`
WHERE SAFE_CAST(price AS NUMERIC) IS NULL
LIMIT 20;


-- Melihat 10 product_id dengan transaksi terbanyak
SELECT product_id, COUNT(*) AS freq
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction`
GROUP BY product_id
ORDER BY freq DESC
LIMIT 10;



-- Cek apakah ada product_id di transaksi yang tidak ada di tabel master product
SELECT COUNT(DISTINCT t.product_id) AS missing_products
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction` t
LEFT JOIN `rakamin-kf-analytics-475702.kimia_farma.kf_product` p
  ON t.product_id = p.product_id
WHERE p.product_id IS NULL;



-- Mengecek apakah ada duplikat transaction_id 
SELECT transaction_id, COUNT(*) AS freq 
FROM rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction 
GROUP BY transaction_id HAVING COUNT(*) > 1;



-- Melihat rentang waktu transaksi 
SELECT MIN(date) AS tanggal_terawal, 
MAX(date) AS tanggal_terakhir 
FROM rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction;


