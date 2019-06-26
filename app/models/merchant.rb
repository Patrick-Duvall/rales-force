class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_customer
    # customers.distinct
    # .select("COUNT(invoices.id) as invoice_count, customers.*")
    # .joins(invoices: [:merchant, :transactions])
    # .where(transactions: {result: "success"}, merchants: {id: self.id})
    # .group(:id).first
    customers.select("COUNT(invoices.id) as invoice_count, customers.*")
    .joins(:transactions)
    .where(transactions: {result: "success"})
    .group('customers.id')
    .order(:invoice_count)
    .last
  end
end
