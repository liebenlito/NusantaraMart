DROP TABLE IF EXISTS transaction_detail;
DROP TABLE IF EXISTS sales_transaction;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M','F')),
    birth_date DATE,
    city VARCHAR(50),
    registration_date DATE NOT NULL
);

CREATE TABLE category (
    category_id VARCHAR(10) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE product (
    product_id VARCHAR(10) PRIMARY KEY,
    category_id VARCHAR(10) NOT NULL REFERENCES category(category_id),
    product_name VARCHAR(150) NOT NULL,
    brand VARCHAR(100),
    unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price > 0)
);

CREATE TABLE store (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    store_type VARCHAR(20) NOT NULL
        CHECK (store_type IN ('SUPERMARKET','MINIMARKET'))
);

CREATE TABLE sales_transaction (
    transaction_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(10) REFERENCES customer(customer_id),
    store_id VARCHAR(10) NOT NULL REFERENCES store(store_id),
    transaction_date TIMESTAMP NOT NULL,
    payment_method VARCHAR(20) NOT NULL
        CHECK (payment_method IN ('CASH','DEBIT','CREDIT_CARD','QRIS','E_WALLET'))
);

CREATE TABLE transaction_detail (
    transaction_id VARCHAR(20) NOT NULL REFERENCES sales_transaction(transaction_id),
    product_id VARCHAR(10) NOT NULL REFERENCES product(product_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price > 0),
    discount NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (discount >= 0),
    PRIMARY KEY (transaction_id, product_id),
    CHECK (discount <= quantity * unit_price)
);

CREATE INDEX idx_sales_transaction_date ON sales_transaction(transaction_date);
CREATE INDEX idx_sales_transaction_customer ON sales_transaction(customer_id);
CREATE INDEX idx_sales_transaction_store ON sales_transaction(store_id);
CREATE INDEX idx_product_category ON product(category_id);
