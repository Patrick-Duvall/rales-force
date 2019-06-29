class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    #what is the comment about
    merchant = Merchant.find(params["id"])
    render json: ItemSerializer.new(merchant.items)
  end
end
