# README

This project comes with corresponding csvs in the `app/data` folder. In order to create and populate your database locally run
`rake db:create` followed by `rake import:all`, this may take a while.(~2 min)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:



Single Merchant
GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x
BOSS MODE: GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success. This means all transactions are failed. Postgres has an EXCEPT operator that might be useful. ActiveRecord also has a find_by_sql that might help.
NOTE: Failed charges should never be counted in revenue totals or statistics.

NOTE: All revenues should be reported as a float with two decimal places.
