INSERT INTO customers (first_name, last_name, age, email, country, postal_code)
SELECT 
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_country,
    customer_postal_code
FROM raw;

INSERT INTO pets (customer_id, type, name, breed)
SELECT 
    c.id,
    r.customer_pet_type,
    r.customer_pet_name,
    r.customer_pet_breed
FROM raw AS r
JOIN customers AS c ON c.email = r.customer_email;

INSERT INTO sellers (first_name, last_name, email, country, postal_code)
SELECT 
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_country,
    seller_postal_code
FROM raw;

INSERT INTO products (
    name, 
    category, 
    price, 
    weight, 
    color, 
    size, 
    brand, 
    material, 
    description, 
    rating, 
    reviews, 
    release_date, 
    expiry_date, 
    pet_category
) 
SELECT 
    product_name,
    product_category,
    product_price,
    product_weight,
    product_color,
    product_size,
    product_brand,
    product_material,
    product_description,
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date,
    pet_category
FROM raw;

INSERT INTO stores (name, location, city, state, country, phone, email)
SELECT 
    store_name,
    store_location,
    store_city,
    store_state,
    store_country,
    store_phone,
    store_email
FROM raw;

INSERT INTO suppliers (name, contact, email, phone, address, city, country)
SELECT 
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country
FROM raw;

INSERT INTO sales (
    sale_date, 
    quantity, 
    total_price,
    supplier_id,
    customer_id,
    seller_id,
    product_id,
    store_id
) 
SELECT 
    r.sale_date,
    r.sale_quantity,
    r.sale_total_price,
    su.id AS supplier_id,
    c.id AS customer_id,
    sel.id AS seller_id,
    p.id AS product_id,
    st.id AS store_id
FROM raw r
LEFT JOIN suppliers AS su ON r.supplier_email = su.email
LEFT JOIN customers AS c ON r.customer_email = c.email
LEFT JOIN sellers AS sel ON r.seller_email = sel.email
LEFT JOIN products AS p ON r.product_name = p.name AND r.product_price = p.price
LEFT JOIN stores AS st ON r.store_email = st.email;
