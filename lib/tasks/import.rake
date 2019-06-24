require 'csv'

namespace :import do
  desc "Import csv to DB "
    task all: :environment do
    csv_text = File.read('./app/data/merchants.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Merchant.create!(row.to_hash)
    end

    csv_text = File.read('./app/data/customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Customer.create!(row.to_hash)
    end

    csv_text = File.read('./app/data/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Item.create!(row.to_hash)
    end

    csv_text = File.read('./app/data/invoices.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Invoice.create!(row.to_hash)
    end

    csv_text = File.read('./app/data/invoice_items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      InvoiceItem.create!(row.to_hash)
    end

    csv_text = File.read('./app/data/transactions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Transaction.create!(row.to_hash)
    end
  end
end
