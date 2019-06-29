class Api::V1::Merchants::SearchController < ApplicationController
  def show
    if search_params && search_params != {}
      render json: MerchantSerializer.new(Merchant.find_by(search_params))
    else
      random = Merchant.pluck(:id).sample
      render json: MerchantSerializer.new(Merchant.find(random))
    end
  end


  def index
    render json: MerchantSerializer.new(Merchant.find_all(search_params))
  end

  private

  def search_params
    params.permit(:id, :created_at, :updated_at, :name)
  end

end
