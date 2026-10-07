--Question : Quel pays réalise le meilleur CA chaque semaine ?
-- Prérequis : exécuter 01_schema.sql au préalable (renommage des tables, clés)
-- Tables utilisées : sales
-- Logique : on calcule le CA total par pays et par semaine (DATE_TRUNC),
-- puis on classe les pays au sein de chaque semaine (RANK) pour ne garder
-- que celui en tête du classement.

 with ca_pays_semaine as (select country, DATE_TRUNC('week', sale_date) as semaine, sum(total_amount) as ca
 							from sales 
 							group by country , DATE_TRUNC('week', sale_date)),
 classement as (select country, semaine,ca, rank() over(partition by semaine order by ca DESC) as rang
 from ca_pays_semaine)
select country, semaine, ca 
from classement
where rang = 1;