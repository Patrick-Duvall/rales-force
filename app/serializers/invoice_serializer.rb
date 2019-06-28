class InvoiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :customer_id, :merchant_id, :status, :id
end
