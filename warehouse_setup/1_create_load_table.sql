CREATE SCHEMA IF NOT EXISTS warehouse;
CREATE SCHEMA IF NOT EXISTS snapshots;

DROP TABLE IF EXISTS warehouse.product;
CREATE TABLE warehouse.product (
    product_id VARCHAR(100),
    product_name VARCHAR(100),
    unit_cost INT,
    unit_price INT
);
COPY warehouse.product(product_id,product_name,unit_cost,unit_price)
FROM '/input_data/product.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS warehouse.purchase;
CREATE TABLE warehouse.purchase (
    purchase_id VARCHAR(6),
    purchase_date VARCHAR(100),
    purchase_product_id VARCHAR(6),
    purchase_quantity INT,
    purchase_price INT,
    purchase_amount INT
);
COPY warehouse.purchase(purchase_id,purchase_date,purchase_product_id,purchase_quantity,purchase_price,purchase_amount)
FROM '/input_data/purchase.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS warehouse.sale;
CREATE TABLE warehouse.sale (
    sale_id VARCHAR(6),
    sale_date VARCHAR(100),
    sale_client VARCHAR(100),
    sale_product_id VARCHAR(6),
    sale_quantity INT,
    sale_amount INT,
    sale_note VARCHAR(300)
);
COPY warehouse.sale(sale_id,sale_date,sale_client,sale_product_id,sale_quantity,sale_amount,sale_note)
FROM '/input_data/sale.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS warehouse.shipment;
CREATE TABLE warehouse.shipment (
    shipment_id VARCHAR(6),
    shipment_sale_id VARCHAR(6),
    shipment_date VARCHAR(100),
    shipment_product_id VARCHAR(6),
    shipment_quantity INT,
    shipment_amount INT
);
COPY warehouse.shipment(shipment_id,shipment_sale_id,shipment_date,shipment_product_id,shipment_quantity,shipment_amount)
FROM '/input_data/shipment.csv' DELIMITER ',' CSV HEADER;