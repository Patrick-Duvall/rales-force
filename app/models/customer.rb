class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices
end
# 
# Customer.select("COUNT(invoices.id) as invoice_count, customers.*").joins(invoices: [:merchants, :transactions]).where(transa
# ctions: {result: "success"}, merchants: {id: 4}).group(:id).limit(5)
