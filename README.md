# README

This project comes with corresponding csvs in the `app/data` folder. In order to create and populate your database locally run
`rake db:create` followed by `rake import:all`, this may take a while.(~2 min)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:


GET /api/v1/merchants/revenue?date=x returns the total revenue for date x across all merchants
Assume the dates provided match the format of a standard ActiveRecord timestamp.

Single Merchant
GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x
BOSS MODE: GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.
NOTE: Failed charges should never be counted in revenue totals or statistics.

NOTE: All revenues should be reported as a float with two decimal places.

Items
GET /api/v1/items/most_revenue?quantity=x returns the top x items ranked by total revenue generated
GET /api/v1/items/most_items?quantity=x returns the top x item instances ranked by total number sold
GET /api/v1/items/:id/best_day returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.
