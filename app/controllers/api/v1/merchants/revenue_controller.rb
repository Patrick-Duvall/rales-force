class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    merchant = Merchant.find(params["id"])
    if params['date']
    render json: RevenueSerializer.new(merchant.total_revenue_on(params['date']))
    else
    render json: RevenueSerializer.new(merchant.total_revenue)
  end
  end
end
