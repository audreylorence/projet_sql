-- Question : Quels produits ont un stock élevé par rapport à leurs ventes, par pays ?
-- Prérequis : exécuter 01_schema.sql au préalable (renommage des tables, clés)
-- Tables utilisées : products, stock, sales, sales_items
-- Logique : une première CTE calcule le stock par produit et par pays, une seconde calcule
-- la quantité vendue par produit et par pays. La requête finale calcule le ratio stock/ventes :
-- un ratio au-dessus de 30, ou un ratio impossible à calculer (ventes nulles), signale
-- un produit en surstock par rapport à sa demande.

WITH stock_pays_produits AS (
    SELECT p.product_id, SUM(st.stock_quantity) AS qte_stock, st.country
    FROM products p
    JOIN stock st ON p.product_id = st.product_id
    GROUP BY p.product_id, st.country
),
vente_pays_produits AS (
    SELECT s.country, p.product_id, SUM(si.quantity) AS qte_vendue
    FROM sales s
    JOIN sales_items si ON s.sale_id = si.sale_id
    JOIN products p ON p.product_id = si.product_id
    GROUP BY s.country, p.product_id
)
SELECT spp.product_id, spp.country, spp.qte_stock, vpp.qte_vendue,
       spp.qte_stock / NULLIF(vpp.qte_vendue, 0) AS ratio
FROM stock_pays_produits spp
LEFT JOIN vente_pays_produits vpp 
    ON vpp.product_id = spp.product_id 
    AND vpp.country = spp.country
WHERE spp.qte_stock / NULLIF(vpp.qte_vendue, 0) > 30
   OR vpp.qte_vendue IS NULL
ORDER BY ratio DESC;