FactoryBot.define do
  factory :invoice_item do
    item { nil }
    invoice { nil }
    quantity { "MyString" }
    unit_price { "MyString" }
  end
end
