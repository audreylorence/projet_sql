-- Question : Quelle tranche d'âge dépense le plus en moyenne par client ?
-- Prérequis : exécuter 01_schema.sql au préalable (renommage des tables, clés)
-- Tables utilisées : customers, sales
-- Logique : une première CTE compte le nombre de clients par tranche d'âge, une seconde
-- calcule le CA total généré par tranche d'âge. La requête finale calcule le CA moyen
-- par client dans chaque tranche, classé par ordre décroissant.

WITH nb_clients_agerange AS (
    SELECT age_range, COUNT(customer_id) AS nb_client
    FROM customers
    GROUP BY age_range
),
nb_achat_agerange AS (
    SELECT c.age_range, SUM(s.total_amount) AS ca
    FROM customers c
    JOIN sales s ON s.customer_id = c.customer_id
    GROUP BY c.age_range
)
SELECT nca.age_range, naa.ca / nca.nb_client AS ratio
FROM nb_clients_agerange nca
JOIN nb_achat_agerange naa ON nca.age_range = naa.age_range
ORDER BY ratio DESC;