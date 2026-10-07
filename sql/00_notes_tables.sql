-- Objet : documentation de référence des tables utilisées dans le projet
-- (colonnes de chaque table, après exécution de 01_schema.sql).
-- Ce fichier n'est pas destiné à être exécuté, il sert de pense-bête
-- pour comprendre la structure des données en consultant les scripts d'analyse.

/*
campaigns:    campaign_id, campaign_name, start_date, end_date, channel, discount_type, discount_value

channels:     channel, description

customers:    customer_id, country, age_range, signup_date

products:     product_id, product_name, category, brand, color, size, catalog_price, cost_price, gender

sales:        sale_id, channel, discounted, total_amount, sale_date, customer_id, country

sales_items:  item_id, sale_id, product_id, quantity, original_price, unit_price, 
				discount_applied, discount_percent, discounted, item_total, sale_date, channel, channel_campaigns
				
stock:        country, product_id, stock_quantity
*/