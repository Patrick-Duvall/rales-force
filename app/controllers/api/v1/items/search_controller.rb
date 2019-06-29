class Api::V1::Items::SearchController < ApplicationController
  def show
    query = search_params.keys[0]
    if search_params && query == ("created_at") || query == ("updated_at")
      render json: ItemSerializer.new(Item.find_all(search_params).last)
    elsif search_params && search_params != {}
      render json: ItemSerializer.new(Item.find_by(search_params))
    else
      render json: ItemSerializer.new(Item.random)
    end
  end


  def index
    render json: ItemSerializer.new(Item.find_all(search_params))
  end

  private

  def search_params
    terms = params.permit(:id, :created_at, :updated_at, :name, :description, :merchant_id, :unit_price)
    terms['unit_price'] = terms['unit_price'].gsub(".", '') if terms['unit_price']
    terms
  end

  # def search_params
  #   new_params = params
  #   new_params[:unit_price] = new_params[:unit_price].gsub(".", '')
  #   new_params
  # end

end
