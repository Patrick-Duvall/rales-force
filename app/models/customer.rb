class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    merchants.select("COUNT(invoices.id) as invoice_count, merchants.*")
    .joins(:transactions)
    .merge(Transaction.successful)
    .group('merchants.id')
    .order(:invoice_count)
    .last
  end
end
