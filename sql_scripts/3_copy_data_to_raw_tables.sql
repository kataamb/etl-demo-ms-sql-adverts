use adverts_db_mssql;

bulk insert raw.categories
from '/data_tables_uuid/utf16_categories.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,  
    ROWTERMINATOR = '0x0a',  
    FIELDTERMINATOR = ';'
);

bulk insert raw.profiles
from '/data_tables_uuid/utf16_profiles.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,  
    ROWTERMINATOR = '0x0a',  
    FIELDTERMINATOR = ';'
);

bulk insert raw.customers
from '/data_tables_uuid/utf16_customers.csv'
with (
	format = 'csv',
	firstrow = 2,
	rowterminator = '0x0a',
	fieldterminator = ';'
);

bulk insert raw.sellers
from '/data_tables_uuid/utf16_sellers.csv'
with (
	format = 'csv',
	firstrow = 2,
	rowterminator = '0x0a',
	fieldterminator = ';'
);

bulk insert raw.adverts
from '/data_tables_uuid/utf16_adverts.csv'
with (
	format = 'csv',
	firstrow = 2,
	rowterminator = '0x0a',
	fieldterminator = ';'
);

bulk insert raw.deals
from '/data_tables_uuid/utf16_deals.csv'
with (
	format = 'csv',
	firstrow = 2,
	rowterminator = '0x0a',
	fieldterminator = ';'
);


bulk insert raw.likes
from '/data_tables_uuid/utf16_likes.csv'
with (
	format = 'csv',
	firstrow = 2,
	rowterminator = '0x0a',
	fieldterminator = ';'
);
