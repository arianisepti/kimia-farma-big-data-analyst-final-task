-- Membuat tabel gabungan untuk analisis
CREATE OR REPLACE TABLE `rakamin-kf-analytics-475702.kimia_farma.kf_main_table` AS
SELECT
  ft.transaction_id,
  ft.date,
  ft.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  ft.customer_name,
  ft.product_id,
  p.product_name,
  p.product_category,
  p.price AS actual_price,
  ft.discount_percentage,
  ft.rating AS rating_transaksi,
  inv.opname_stock AS current_stock,

  -- Hitung harga setelah diskon (nett sales)
  (p.price * (1 - ft.discount_percentage / 100)) AS nett_sales,

  -- Hitung persentase laba berdasarkan ketentuan
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  -- Hitung nett profit (laba bersih)
  ((p.price * (1 - ft.discount_percentage / 100)) *
   CASE
     WHEN p.price <= 50000 THEN 0.10
     WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
     WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
     WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
     ELSE 0.30
   END) AS nett_profit

   
FROM `rakamin-kf-analytics-475702.kimia_farma.kf_final_transaction` AS ft
LEFT JOIN `rakamin-kf-analytics-475702.kimia_farma.kf_inventory` AS inv
  ON ft.branch_id = inv.branch_id AND ft.product_id = inv.product_id
LEFT JOIN `rakamin-kf-analytics-475702.kimia_farma.kf_kantor_cabang` AS kc
  ON ft.branch_id = kc.branch_id
LEFT JOIN `rakamin-kf-analytics-475702.kimia_farma.kf_product` AS p
  ON ft.product_id = p.product_id;
