class Api::V1::Merchants::SearchController < ApplicationController
  def show
    if params['id']
      render json: MerchantSerializer.new(Merchant.find(params['id']))
    else if params['name']
      render json: MerchantSerializer.new(Merchant.find_by(name: params['name']))
    end
  end
  end
end
