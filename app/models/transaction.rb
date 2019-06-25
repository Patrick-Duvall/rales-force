class Transaction < ApplicationRecord
  belongs_to :invoice, foreign_key: 'invoice_id'

end
