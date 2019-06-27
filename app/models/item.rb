class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(limit)
    select("items.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .joins(invoices: :transactions)
    .group(:id)
    .merge(Transaction.successful)
    .order(revenue: :desc)
    .limit(limit)
  end

  def self.most_sold(limit)
    joins(invoices: :transactions)
    .select("items.*,SUM(invoice_items.quantity) AS sold")
    .merge(Transaction.successful)
    .group(:id)
    .order(sold: :desc)
    .limit(limit)
  end

  # Item.select("items.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins(invoices: :transactions).group(:id).merge(Transaction.successful).order(revenue: :desc).limit(1)
end
# .merge(Transaction.successful)
