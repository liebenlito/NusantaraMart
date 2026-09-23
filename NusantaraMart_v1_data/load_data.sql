-- Jalankan dari psql dengan working directory 01_oltp
\copy category FROM 'category.csv' WITH (FORMAT csv, HEADER true);
\copy product FROM 'product.csv' WITH (FORMAT csv, HEADER true);
\copy store FROM 'store.csv' WITH (FORMAT csv, HEADER true);
\copy customer FROM 'customer.csv' WITH (FORMAT csv, HEADER true, NULL '');
\copy sales_transaction FROM 'sales_transaction.csv' WITH (FORMAT csv, HEADER true, NULL '');
\copy transaction_detail FROM 'transaction_detail.csv' WITH (FORMAT csv, HEADER true);
