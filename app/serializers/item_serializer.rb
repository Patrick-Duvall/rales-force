class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
