
-- Table: dimcustomer
CREATE TABLE dimcustomer (
    customer_key INT PRIMARY KEY,
    customer_type VARCHAR(50),
    is_repeated_guest BOOLEAN,
    market_segment VARCHAR(100),
    distribution_channel VARCHAR(100),
    deposit_type VARCHAR(50),
    waiting_list BOOLEAN
);

-- Table: dimdate
CREATE TABLE dimdate (
    date_key INT PRIMARY KEY,
    day INT,
    month INT,
    quarter INT,
    year INT,
    season VARCHAR(20),
    is_week_end BOOLEAN
);

-- Table: dimhotel
CREATE TABLE dimhotel (
    hotel_key INT PRIMARY KEY,
    hotel_type VARCHAR(100),
    hotel_country VARCHAR(100)
);

-- Table: dimcountry
CREATE TABLE dimcountry (
    country_key INT PRIMARY KEY,
    country_name VARCHAR(100),
    region VARCHAR(100)
);

-- Table: room_dim
CREATE TABLE room_dim (
    room_key INT PRIMARY KEY,
    reserved_room_type VARCHAR(50),
    assigned_room_type VARCHAR(50)
);

-- Table: factbooking
CREATE TABLE factbooking (
    booking_id INT PRIMARY KEY,
    is_canceled BOOLEAN,
    lead_time INT,
    stay_total_nights INT,
    total_guests INT,
    revenue DECIMAL(10, 2),
    total_of_special_requests INT,
    hotel_key INT,
    date_key INT,
    customer_key INT,
    room_key INT,
    country_key INT,
    FOREIGN KEY (hotel_key) REFERENCES dimhotel(hotel_key),
    FOREIGN KEY (date_key) REFERENCES dimdate(date_key),
    FOREIGN KEY (customer_key) REFERENCES dimcustomer(customer_key),
    FOREIGN KEY (room_key) REFERENCES room_dim(room_key),
    FOREIGN KEY (country_key) REFERENCES dimcountry(country_key)
);
