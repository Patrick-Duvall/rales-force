class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    require "pry"; binding.pry
    render json: MerchantSerializer.new(Merchant.most_items(params["quantity"]))
  end
end
