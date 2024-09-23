# Database Table Design

# 1. Users Table
* This table stores information about the users of the application. It differentiates between normal and retail users and stores login credentials, email, and phone number.
	`CREATE TABLE Users (
	    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	    user_type ENUM('NORMAL', 'RETAIL') NOT NULL,
	    email VARCHAR(100) NOT NULL UNIQUE,
	    phone_number VARCHAR(20) UNIQUE,
	    password VARCHAR(255) NOT NULL,
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);`
	
#2. UserAddresses Table
This table stores multiple addresses for each user, allowing flexibility in choosing a delivery address.

	`CREATE TABLE UserAddresses (
	    address_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	    user_id BIGINT NOT NULL,
	    address TEXT NOT NULL,
	    city VARCHAR(100) NOT NULL,
	    state VARCHAR(100) NOT NULL,
	    zip_code VARCHAR(20) NOT NULL,
	    country VARCHAR(50) NOT NULL,
	    is_default BOOLEAN DEFAULT FALSE,
	    latitude DECIMAL(9, 6),
	    longitude DECIMAL(9, 6),
	    FOREIGN KEY (user_id) REFERENCES Users(user_id)
	);`	
	
#3. Products Table
Stores product details, such as name, description, price, and available stock.

	`CREATE TABLE Products (
	    product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	    name VARCHAR(255) NOT NULL,
	    description TEXT,
	    price DECIMAL(10, 2) NOT NULL,
	    product_type VARCHAR(50) NOT NULL,
	    stock_quantity INT DEFAULT 0,
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
	`
	
#4. Orders Table
This table stores order information, including the user who placed the order, the delivery address, and order status.

	`CREATE TABLE Orders (
	    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	    user_id BIGINT NOT NULL,
	    address_id BIGINT NOT NULL,
	    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    total_amount DECIMAL(10, 2) NOT NULL,
	    delivery_charges DECIMAL(10, 2),
	    discount_id BIGINT,
	    status ENUM('PENDING', 'DELIVERED', 'CANCELLED') DEFAULT 'PENDING',
	    FOREIGN KEY (user_id) REFERENCES Users(user_id),
	    FOREIGN KEY (address_id) REFERENCES UserAddresses(address_id),
	    FOREIGN KEY (discount_id) REFERENCES Discounts(discount_id)
	);
	`		

#5. OrderItems Table
Stores individual products for each order, handling both single-product and multiple-product orders.

	`CREATE TABLE OrderItems (
	    order_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	    order_id BIGINT NOT NULL,
	    product_id BIGINT NOT NULL,
	    quantity INT NOT NULL,
	    price_at_order DECIMAL(10, 2) NOT NULL,
	    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	    FOREIGN KEY (product_id) REFERENCES Products(product_id)
	);
	`
	
#6. Warehouse Table:
Stores the stock of products in different warehouses.

	`CREATE TABLE Warehouse (
	    warehouse_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	    product_id BIGINT NOT NULL,
	    stock_quantity INT NOT NULL,
	    location VARCHAR(255),
	    FOREIGN KEY (product_id) REFERENCES Products(product_id)
	);
	`

#7. Discounts Table
Stores discounts available to users, which can be applied to specific users or during specific time frames.

	`CREATE TABLE Discounts (
	    discount_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	    discount_code VARCHAR(50) NOT NULL,
	    discount_value DECIMAL(5, 2) NOT NULL,
	    valid_from TIMESTAMP,
	    valid_until TIMESTAMP,
	    user_id BIGINT,
	    FOREIGN KEY (user_id) REFERENCES Users(user_id)
	);
	`	

#8. Deliveries Table
Tracks the delivery status and provides the option for tracking based on map coordinates.

	`CREATE TABLE Deliveries (
	    delivery_id BIGINT AUTO_INCREMENT PRIMARY KEY,
	    order_id BIGINT NOT NULL,
	    delivery_status ENUM('PENDING', 'OUT_FOR_DELIVERY', 'DELIVERED') DEFAULT 'PENDING',
	    delivery_charges DECIMAL(10, 2),
	    map_url VARCHAR(255),
	    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
	);
	`
	
	