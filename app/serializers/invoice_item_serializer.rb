class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity
  attribute :unit_price do |object|
    object.unit_price.fdiv(100).to_s
  end
end
