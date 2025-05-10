CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS sellers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    weight DECIMAL(10,2),
    color VARCHAR(50),
    size VARCHAR(50),
    brand VARCHAR(100),
    material VARCHAR(100),
    description TEXT,
    rating DECIMAL(3,2),
    reviews INT,
    release_date DATE,
    expiry_date DATE,
    pet_category VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS stores (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS suppliers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS pets (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE SET NULL,
    type VARCHAR(50),
    name VARCHAR(100),
    breed VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS sales (
    id SERIAL PRIMARY KEY,
    sale_date DATE,
    customer_id INT REFERENCES customers(id) ON DELETE SET NULL,
    seller_id INT REFERENCES sellers(id) ON DELETE SET NULL,
    product_id INT REFERENCES products(id) ON DELETE SET NULL,
    store_id INT REFERENCES stores(id) ON DELETE SET NULL,
    supplier_id INT REFERENCES suppliers(id) ON DELETE SET NULL,
    quantity INT,
    total_price DECIMAL(10,2)
);
