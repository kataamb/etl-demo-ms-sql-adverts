use adverts_db_mssql;

CREATE TABLE clear.categories (
    id UNIQUEIDENTIFIER PRIMARY KEY,
    name NVARCHAR(50) NOT NULL UNIQUE,
    
    etl_batch_id INT,
    etl_load_date DATETIME DEFAULT GETDATE(),
    etl_update_date DATETIME
);

CREATE TABLE clear.profiles (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    nickname NVARCHAR(50) NOT NULL UNIQUE,
    fio NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    phone_number NVARCHAR(20),
    password NVARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    
    etl_batch_id INT,
    etl_load_date DATETIME DEFAULT GETDATE(),
    etl_update_date DATETIME
);

CREATE TABLE clear.customers (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    profile_id UNIQUEIDENTIFIER NOT NULL,
    rating INT NOT NULL DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    
    etl_batch_id INT,
    etl_load_date DATETIME DEFAULT GETDATE(),
    etl_update_date DATETIME
);

CREATE TABLE clear.sellers (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    profile_id UNIQUEIDENTIFIER NOT NULL,
    rating INT NOT NULL DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    
    etl_batch_id INT,
    etl_load_date DATETIME DEFAULT GETDATE(),
    etl_update_date DATETIME
);

CREATE TABLE clear.adverts (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    content NVARCHAR(MAX) NOT NULL,
    description NVARCHAR(MAX),
    id_category UNIQUEIDENTIFIER NOT NULL,
    price INT NOT NULL CHECK (price >= 0),
    id_seller UNIQUEIDENTIFIER NOT NULL,
    date_created DATETIME DEFAULT GETDATE(),
    
    etl_batch_id INT,
    etl_load_date DATETIME DEFAULT GETDATE(),
    etl_update_date DATETIME
);

CREATE TABLE clear.deals (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    id_advert UNIQUEIDENTIFIER NOT NULL,
    id_customer UNIQUEIDENTIFIER NOT NULL,
    date_created DATETIME DEFAULT GETDATE(),
    address NVARCHAR(MAX) NOT NULL,
    
    etl_batch_id INT,
    etl_load_date DATETIME DEFAULT GETDATE(),
    etl_update_date DATETIME
);

CREATE TABLE clear.likes (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    id_customer UNIQUEIDENTIFIER NOT NULL,
    id_advert UNIQUEIDENTIFIER NOT NULL,
    date_created DATETIME DEFAULT GETDATE(),
    
    CONSTRAINT UQ_likes_customer_advert UNIQUE (id_customer, id_advert),
    
    etl_batch_id INT,
    etl_load_date DATETIME DEFAULT GETDATE(),
    etl_update_date DATETIME
);

ALTER TABLE clear.customers ADD CONSTRAINT FK_customers_profiles 
    FOREIGN KEY (profile_id) REFERENCES clear.profiles(id);
    
ALTER TABLE clear.sellers ADD CONSTRAINT FK_sellers_profiles 
    FOREIGN KEY (profile_id) REFERENCES clear.profiles(id);
    
ALTER TABLE clear.adverts ADD CONSTRAINT FK_adverts_categories 
    FOREIGN KEY (id_category) REFERENCES clear.categories(id);
    
ALTER TABLE clear.adverts ADD CONSTRAINT FK_adverts_sellers 
    FOREIGN KEY (id_seller) REFERENCES clear.sellers(id);
    
ALTER TABLE clear.deals ADD CONSTRAINT FK_deals_adverts 
    FOREIGN KEY (id_advert) REFERENCES clear.adverts(id);
    
ALTER TABLE clear.deals ADD CONSTRAINT FK_deals_customers 
    FOREIGN KEY (id_customer) REFERENCES clear.customers(id);
    
ALTER TABLE clear.likes ADD CONSTRAINT FK_likes_customers 
    FOREIGN KEY (id_customer) REFERENCES clear.customers(id);
    
ALTER TABLE clear.likes ADD CONSTRAINT FK_likes_adverts 
    FOREIGN KEY (id_advert) REFERENCES clear.adverts(id);
