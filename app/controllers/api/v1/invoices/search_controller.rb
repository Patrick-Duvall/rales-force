class Api::V1::Invoices::SearchController < ApplicationController
  def show
    if search_params && search_params != {}
      render json: InvoiceSerializer.new(Invoice.find_by(search_params))
    else
      render json: InvoiceSerializer.new(Invoice.random)
    end
  end


  def index
    render json: InvoiceSerializer.new(Invoice.find_all(search_params))
  end

  private

  def search_params
    params.permit(:id, :customer_id, :merchant_id, :created_at, :updated_at, :status)
  end

end
