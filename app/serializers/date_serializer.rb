class DateSerializer
  include FastJsonapi::ObjectSerializer
  attribute :best_day do |object|
    object.created_at.to_date
  end
end
