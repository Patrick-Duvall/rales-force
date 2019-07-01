# README
Rales force is a restful API built in one week based on the [Turing School of Software and Design Project Here](https://backend.turing.io/module3/projects/rails_engine).

This project was built using:
#### Ruby Version:
2.4.1p111 (2017-03-22 revision 58053)

#### Rails Version:
Rails 5.2.3

####To Use

This project comes with corresponding csvs in the `app/data` folder. In order to create and populate your database locally 

1. Git Clone this Repo

1. `bundle install` to fetch system dependencies

1. `rake db:create` followed by `rake import:all`, this may take a while.(~3 min)

1. `$ rails s` To start your server

1. Visit http://0.0.0.0:3000/ either in your browser or using Postman(https://www.getpostman.com/)

1. To vist an endpoint append the endpoint to `http://0.0.0.0:3000/`, so to `GET /api/v1/merchants` visit http://0.0.0.0:3000/api/v1/merchants .

## Endpoints
All endpoints are returned as Standard JSON API using (Fast JSON API)[https://github.com/Netflix/fast_jsonapi]

#### Record
All resources in the CSVs have SHOW and INDEX funtionality and the ability to sort by every resource attribute. For example
`GET /api/v1/merchants` returns all merchants
`GET /api/v1/items/1` returns the item with an ID of 1
`GET /api/v1/invoice_items/random` returns a random invoice item
`GET /api/v1/merchants/find?name=Cummins-Theil` returns the first merchant with the name Cummins-Theil
`GET /api/v1/customers/find_all?first_name=Peter` returns the all customers with a first name of Peter

#### Relationship
In addition to record enpoints the following relationship endpoints are implemented . 
###### Merchants
`GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant . 
`GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders . 
###### Invoices
`GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions . 
`GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items . 
`GET /api/v1/invoices/:id/items` returns a collection of associated items . 
`GET /api/v1/invoices/:id/customer` returns the associated customer . 
`GET /api/v1/invoices/:id/merchant` returns the associated merchant . 
###### Invoice Items
`GET /api/v1/invoice_items/:id/invoice` returns the associated invoice . 
`GET /api/v1/invoice_items/:id/item` returns the associated item . 
###### Items
`GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items . 
`GET /api/v1/items/:id/merchant` returns the associated merchant . 
###### Transactions
`GET /api/v1/transactions/:id/invoice` returns the associated invoice .   
###### Customers
`GET /api/v1/customers/:id/invoices` returns a collection of associated invoices . 
`GET /api/v1/customers/:id/transactions` returns a collection of associated transactions . 

#### Business intelligence
These Endpoints also exist to provide relevant business intelligence logic.
###### All Merchants
- `GET /api/v1/merchants/most_revenue?quantity=x` returns the top x merchants ranked by total revenue .    
- `GET /api/v1/merchants/most_items?quantity=x` returns the top x merchants ranked by total number of items sold . 
- `GET /api/v1/merchants/revenue?date=x` returns the total revenue for date x across all merchants,
assumes the dates provided match the format of a standard ActiveRecord timestamp .   
###### Single Merchant
- `GET /api/v1/merchants/:id/revenue` returns the total revenue for that merchant across successful transactions . 
- `GET /api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date x . 
- `GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions . 
- `GET /api/v1/merchants/:id/customers_with_pending_invoices` returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success . 
###### Items
- `GET /api/v1/items/most_revenue?quantity=x` returns the top x items ranked by total revenue generated . 
- `GET /api/v1/items/most_items?quantity=x` returns the top x item instances ranked by total number sold . 
- `GET /api/v1/items/:id/best_da`y returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, returns the most recent day . 
###### Customers
- `GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions . 
