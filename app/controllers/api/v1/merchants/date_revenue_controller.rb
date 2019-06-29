class Api::V1::Merchants::DateRevenueController < ApplicationController
  def show
    require "pry"; binding.pry
    render json: AllMerchantRevenueDateSerializer.new(Merchant.total_revenue(params["date"]))
  end
end
