class Api::V1::Customers::SearchController < ApplicationController
  def show
    if search_params && search_params != {}
      render json: CustomerSerializer.new(Customer.find_by(search_params))
    else
      random = Customer.pluck(:id).sample
      render json: CustomerSerializer.new(Customer.find(random))
    end
  end


  def index
    render json: CustomerSerializer.new(Customer.where(search_params).order(:id))
  end

  private

  def search_params
    params.permit(:id, :created_at, :updated_at, :first_name, :last_name)
  end

end
