class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    require "pry"; binding.pry
    render json: MerchantSerializer.new(Merchant.most_revenue(params["quantity"]))
  end
end
