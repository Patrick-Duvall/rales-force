class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :invoice_id, :credit_card_number, :result, :id
end
