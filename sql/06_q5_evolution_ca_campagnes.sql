-- Question : Comment le CA évolue-t-il d'une campagne à l'autre ?
-- Prérequis : exécuter 01_schema.sql au préalable (renommage des tables, clés)
-- Tables utilisées : sales, campaigns
-- Logique : une CTE calcule le CA total généré pendant chaque campagne, puis la requête
-- finale compare le CA de chaque campagne à celui de la campagne précédente (LAG). 

WITH ca_campagne AS ( SELECT sum(s.total_amount) AS ca_total, c.campaign_name, c.start_date 
						FROM sales s
						JOIN campaigns c ON s.sale_date BETWEEN c.start_date AND c.end_date
						GROUP BY c.campaign_name, c.start_date)
SELECT ca_total, 
	campaign_name, 
	start_date, 
	lag(ca_total) OVER (ORDER BY start_date) AS CA_campagne_precedente,
	ca_total - lag(ca_total) OVER (ORDER BY start_date) AS Evolution
FROM ca_campagne
ORDER BY start_date;