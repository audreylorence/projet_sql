-- Objet : mise en place du schéma de la base — ajout des clés primaires et
-- étrangères sur les tables importées, puis renommage des tables vers des
-- noms courts et lisibles (ex. dataset_fashion_store_sales -> sales).
-- Statut : à exécuter une seule fois, lors de la création de la base.
-- Les scripts d'analyse (02_ à 07_) supposent que ce script a déjà été joué.

-- CLÉS PRIMAIRES

ALTER TABLE dataset_fashion_store_campaigns
ADD CONSTRAINT pk_campaigns PRIMARY KEY (campaign_id);

ALTER TABLE dataset_fashion_store_channels
ADD CONSTRAINT pk_channels PRIMARY KEY (channel);

ALTER TABLE dataset_fashion_store_customers
ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);

ALTER TABLE dataset_fashion_store_products
ADD CONSTRAINT pk_products PRIMARY KEY (product_id);

ALTER TABLE dataset_fashion_store_sales
ADD CONSTRAINT pk_sales PRIMARY KEY (sale_id);

ALTER TABLE dataset_fashion_store_salesitems
ADD CONSTRAINT pk_salesitems PRIMARY KEY (item_id);

ALTER TABLE dataset_fashion_store_stock
ADD CONSTRAINT pk_stock PRIMARY KEY (country, product_id);

-- CLÉS ÉTRANGÈRES

ALTER TABLE dataset_fashion_store_sales
ADD CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id)
REFERENCES dataset_fashion_store_customers (customer_id);

ALTER TABLE dataset_fashion_store_sales
ADD CONSTRAINT fk_sales_channel FOREIGN KEY (channel)
REFERENCES dataset_fashion_store_channels (channel);

ALTER TABLE dataset_fashion_store_salesitems
ADD CONSTRAINT fk_salesitems_sale FOREIGN KEY (sale_id)
REFERENCES dataset_fashion_store_sales (sale_id);

ALTER TABLE dataset_fashion_store_salesitems
ADD CONSTRAINT fk_salesitems_product FOREIGN KEY (product_id)
REFERENCES dataset_fashion_store_products (product_id);

ALTER TABLE dataset_fashion_store_salesitems
ADD CONSTRAINT fk_salesitems_channel FOREIGN KEY (channel)
REFERENCES dataset_fashion_store_channels (channel);

ALTER TABLE dataset_fashion_store_stock
ADD CONSTRAINT fk_stock_product FOREIGN KEY (product_id)
REFERENCES dataset_fashion_store_products (product_id);

ALTER TABLE dataset_fashion_store_campaigns RENAME TO campaigns;
ALTER TABLE dataset_fashion_store_channels RENAME TO channels;
ALTER TABLE dataset_fashion_store_customers RENAME TO customers;
ALTER TABLE dataset_fashion_store_products RENAME TO products;
ALTER TABLE dataset_fashion_store_sales RENAME TO sales;
ALTER TABLE dataset_fashion_store_salesitems RENAME TO sales_items;
ALTER TABLE dataset_fashion_store_stock RENAME TO stock;

