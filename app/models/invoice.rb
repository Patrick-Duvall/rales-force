class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  scope :without_successful_transaction, ->{
    where(_not_exists(Transaction.where("transactions.invoice_id = invoices.id").successful))
  }

end
