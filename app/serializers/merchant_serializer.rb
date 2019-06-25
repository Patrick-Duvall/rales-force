class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id
end
