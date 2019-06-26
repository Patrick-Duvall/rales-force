class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    require "pry"; binding.pry
    merchant = Merchant.find(params["id"]
    render json: CustomerSerializer.new(merchant.favorite_customer)
  end
end
