class RevenueSerializer
  include FastJsonapi::ObjectSerializer

  attribute :revenue do |object|
   object.total_revenue.fdiv(100).to_s
  end
end
