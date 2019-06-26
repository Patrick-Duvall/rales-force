class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(limit)
    joins(items: :invoice_items)
    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .group(:id)
    .order(revenue: :desc)
    .limit(limit)
  end

  def favorite_customer
    #customers does not return distinct
    customers.select("COUNT(invoices.id) as invoice_count, customers.*")
    .joins(:transactions)
    .where(transactions: {result: "success"})
    .group('customers.id')
    .order(:invoice_count)
    .last
  end

end
