# projet_sql

# Analyse SQL — Fashion Store (dataset fictif e-commerce mode)

## Contexte
Projet personnel réalisé dans le cadre de ma formation en data analyse,
en complément de mon activité professionnelle en AdOps. Objectif :
pratiquer le SQL (CTE, fonctions de fenêtre, jointures) sur un jeu de
données relationnel à 7 tables, avant de connecter les résultats à
un dashboard Power BI.

## Données
Dataset fictif d'une boutique de mode en ligne, multi-pays (Europe),
vendant via e-commerce et application mobile.
7 tables : customers, sales, sales_items, products, stock, campaigns, channels.
Période couverte : 04/04/2025 au 17/06/2025.
Source : https://www.kaggle.com/datasets/joycemara/european-fashion-store-multitable-dataset

## Structure du dépôt
```
sql/
├── 00_notes_tables.sql       → documentation des colonnes
├── 01_schema.sql             → clés primaires/étrangères, renommage des tables
├── 02_q1_ca_pays_semaine.sql → CA par pays et par semaine
├── 03_q2_categorie_par_canal.sql → catégorie la plus vendue par canal
├── 04_q3_stock_vs_ventes.sql → produits en surstock par rapport aux ventes
├── 05_q4_ca_par_tranche_age.sql → dépense moyenne par tranche d'âge
├── 06_q5_evolution_ca_campagnes.sql → évolution du CA entre campagnes
└── 07_q6_delai_entre_achats.sql → délai moyen entre deux achats
```

## Questions analysées
1. Quel pays réalise le meilleur CA chaque semaine ?
2. Pour chaque canal de vente, quelle catégorie se vend le plus ?
3. Quels produits ont un stock élevé par rapport à leurs ventes, par pays ?
4. Quelle tranche d'âge dépense le plus en moyenne par client ?
5. Comment le CA évolue-t-il d'une campagne à l'autre ?
6. En moyenne, combien de temps s'écoule entre deux achats pour un même client ?

## Compétences mobilisées
CTE, fonctions de fenêtre (RANK, LAG, PARTITION BY), jointures multiples,
agrégations conditionnelles, gestion des valeurs nulles (NULLIF).
