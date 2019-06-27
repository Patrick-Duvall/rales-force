class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    require "pry"; binding.pry
    render json: ItemSerializer.new(Item.most_revenue(params["quantity"]))
    require "pry"; binding.pry
  end
end

# class Api::V1::Merchants::MostRevenueController < ApplicationController
#   def index
#     render json: MerchantSerializer.new(Merchant.most_revenue(params["quantity"]))
#   end
# end
