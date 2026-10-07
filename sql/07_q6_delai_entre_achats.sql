-- Question : En moyenne, combien de temps s'écoule entre deux achats pour un même client ?
-- Prérequis : exécuter 01_schema.sql au préalable (renommage des tables, clés)
-- Tables utilisées : sales
-- Logique : une première CTE associe à chaque achat la date de l'achat précédent du même
-- client (LAG). Une seconde calcule le délai entre ces deux achats. La requête finale
-- calcule la moyenne de ces délais, pour les clients ayant fait plusieurs achats.
WITH achat_client_precedent AS 
							(SELECT customer_id, 
								sale_id, 
								sale_date, 
								lag(sale_date) OVER (PARTITION BY customer_id ORDER BY sale_date) AS date_achat_precedent
							FROM sales),
delai_achat_par_client AS 
							(SELECT customer_id, sale_id, sale_date - date_achat_precedent AS delai_entre_achat
							FROM achat_client_precedent
							WHERE date_achat_precedent IS NOT NULL)
SELECT round(avg(delai_entre_achat),1) AS delai_moyen
FROM delai_achat_par_client; 

