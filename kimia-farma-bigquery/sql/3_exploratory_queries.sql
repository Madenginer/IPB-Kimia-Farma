-- Total transaksi per tahun
SELECT 
    EXTRACT(YEAR FROM date) AS tahun, 
    COUNT(transaction_id) AS total_transaksi 
FROM kimia_farma.kf_analisa 
GROUP BY tahun 
ORDER BY tahun;

-- Total pendapatan dan laba per tahun
SELECT 
    EXTRACT(YEAR FROM date) AS tahun, 
    SUM(nett_sales) AS total_pendapatan, 
    SUM(nett_profit) AS total_laba 
FROM kimia_farma.kf_analisa 
GROUP BY tahun 
ORDER BY tahun;

-- Cabang dengan transaksi terbesar
SELECT 
    branch_name, 
    kota, 
    provinsi, 
    COUNT(transaction_id) AS jumlah_transaksi, 
    SUM(nett_sales) AS total_penjualan 
FROM kimia_farma.kf_analisa 
GROUP BY branch_name, kota, provinsi 
ORDER BY total_penjualan DESC 
LIMIT 10;

-- Produk dengan pendapatan terbesar
SELECT 
    product_name, 
    COUNT(transaction_id) AS jumlah_terjual, 
    SUM(nett_sales) AS total_pendapatan 
FROM kimia_farma.kf_analisa 
GROUP BY product_name 
ORDER BY total_pendapatan DESC 
LIMIT 10;
