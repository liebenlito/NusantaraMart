# NusantaraMart

NusantaraMart adalah perusahaan retail fiktif dengan beberapa cabang fisik.
Dataset v1 merupakan dataset OLTP bersih untuk transaksi 1 Januari–30 Juni 2026.

## Grain

- customer: satu baris = satu pelanggan
- category: satu baris = satu kategori
- product: satu baris = satu produk
- store: satu baris = satu cabang
- sales_transaction: satu baris = satu transaksi
- transaction_detail: satu baris = satu produk dalam satu transaksi

## Catatan

- `customer_id` pada `sales_transaction` boleh NULL untuk pembeli non-member.
- `product.unit_price` adalah harga katalog/current price.
- `transaction_detail.unit_price` adalah harga saat transaksi.
- Net sales detail = `quantity * unit_price - discount`.
- Total transaksi tidak disimpan sebagai atribut turunan.

## Urutan import

category → product → store → customer → sales_transaction → transaction_detail
