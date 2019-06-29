class AllMerchantRevenueDateSerializer
  include FastJsonapi::ObjectSerializer
  attribute :total_revenue do |object|
   object.total_revenue.fdiv(100).to_s
  end
end
