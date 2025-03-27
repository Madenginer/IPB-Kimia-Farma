-- Rata-rata rating cabang berdasarkan kota
SELECT 
    kota, 
    AVG(rating_cabang) AS avg_rating 
FROM kimia_farma.kf_analisa 
GROUP BY kota 
ORDER BY avg_rating DESC;

-- Rata-rata diskon yang diberikan per provinsi
SELECT 
    provinsi, 
    AVG(discount_percentage) AS avg_discount 
FROM kimia_farma.kf_analisa 
GROUP BY provinsi 
ORDER BY avg_discount DESC;

-- Total profit berdasarkan kategori harga
SELECT 
    CASE 
        WHEN actual_price <= 50000 THEN '≤ 50K'
        WHEN actual_price > 50000 AND actual_price <= 100000 THEN '50K - 100K'
        WHEN actual_price > 100000 AND actual_price <= 300000 THEN '100K - 300K'
        WHEN actual_price > 300000 AND actual_price <= 500000 THEN '300K - 500K'
        ELSE '> 500K'
    END AS kategori_harga,
    SUM(nett_profit) AS total_profit
FROM kimia_farma.kf_analisa
GROUP BY kategori_harga
ORDER BY total_profit DESC;
