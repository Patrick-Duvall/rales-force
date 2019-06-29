class Api::V1::Merchants::DateRevenueController < ApplicationController
  def show
    render json: AllMerchantRevenueDateSerializer.new(Merchant.total_revenue(params["date"]))
  end
end
