class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :merchant_id
  attribute :unit_price do |object|
    object.unit_price.fdiv(100).to_s
  end
end
