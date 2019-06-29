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

  def self.most_items(limit)
    joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*,SUM(invoice_items.quantity) AS sold")
    .merge(Transaction.successful)
    .group(:id)
    .order(sold: :desc)
    .limit(limit)
  end

  def customers_with_pending_invoices
    customers.merge(Invoice.without_successful_transaction)
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

  def total_revenue
    invoices.select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .group('invoices.merchant_id')[0]
  end

  def self.total_revenue(date)
    Invoice.joins(:transactions, :invoice_items)
    .select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .merge(Transaction.successful)
    .where("CAST(invoices.updated_at AS DATE) = CAST('#{date}' AS DATE)")
    .take
  end

  def total_revenue_on(date)
    invoices.joins(:transactions, :invoice_items)
    .select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .merge(Transaction.successful)
    .where("CAST(invoices.updated_at AS DATE) = CAST('#{date}' AS DATE)")
    .take
  end

end
