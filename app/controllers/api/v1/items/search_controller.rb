class Api::V1::Items::SearchController < ApplicationController
  def show
    if search_params && search_params != {}
      render json: ItemSerializer.new(Item.find_by(search_params))
    else
      random = Item.pluck(:id).sample
      render json: ItemSerializer.new(Item.find(random))
    end
  end


  def index
    render json: ItemSerializer.new(Item.where(search_params).order(:id))
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
