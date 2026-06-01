use adverts_db_mssql;

create schema raw;

create table raw.categories(
	id varchar(50),
	name VARCHAR(50)   COLLATE SQL_Latin1_General_CP1251_CI_AS
);


CREATE TABLE raw.profiles (
    id VARCHAR(50),
    nickname NVARCHAR(200),
    fio NVARCHAR(200),
    email NVARCHAR(200),
    phone_number NVARCHAR(200),
    password NVARCHAR(200),
    created_at VARCHAR(50)   
);

CREATE TABLE raw.customers (
    id VARCHAR(50),
    profile_id VARCHAR(50),
    rating VARCHAR(50),       
    created_at VARCHAR(50)
);

CREATE TABLE raw.sellers (
    id VARCHAR(50),
    profile_id VARCHAR(50),
    rating VARCHAR(50),
    created_at VARCHAR(50)
);

CREATE TABLE raw.adverts (
    id VARCHAR(50),
    content NVARCHAR(MAX), 
    description NVARCHAR(MAX),
    id_category VARCHAR(50),
    price VARCHAR(50),
    id_seller VARCHAR(50),
    date_created VARCHAR(50)
);

CREATE TABLE raw.deals (
    id VARCHAR(50),
    id_advert VARCHAR(50),
    id_customer VARCHAR(50),
    date_created VARCHAR(50),
    address NVARCHAR(MAX)
);

CREATE TABLE raw.likes (
    id VARCHAR(50),
    id_customer VARCHAR(50),
    id_advert VARCHAR(50),
    date_created VARCHAR(50)
);