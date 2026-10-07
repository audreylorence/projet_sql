
-- Question : Pour chaque canal de vente, quelle catégorie se vend le plus ?
-- Prérequis : exécuter 01_schema.sql au préalable (renommage des tables, clés)
-- Tables utilisées : sales_items, products
-- Logique : on calcule d'abord la quantité vendue par catégorie et par canal avec une CTE,
-- puis on utilise RANK pour ne garder, pour chaque canal, que la catégorie en tête du classement.

WITH qte_par_cat_channel AS (
    SELECT si.channel, p.category, SUM(si.quantity) AS qte
    FROM sales_items si
    JOIN products p ON p.product_id = si.product_id
    GROUP BY si.channel, p.category
),
classement AS (
    SELECT channel, category, qte,
           RANK() OVER (PARTITION BY channel ORDER BY qte DESC) AS rang
    FROM qte_par_cat_channel
)
SELECT channel, category, qte
FROM classement
WHERE rang = 1;