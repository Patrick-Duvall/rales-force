class Api::V1::Invoices::SearchController < ApplicationController
  def show
    if search_params && search_params != {}
      render json: InvoiceSerializer.new(Invoice.find_by(search_params))
    else
      random = Invoice.pluck(:id).sample
      render json: InvoiceSerializer.new(Invoice.find(random))
    end
  end


  def index
    render json: InvoiceSerializer.new(Invoice.where(search_params).order(:id))
  end

  private

  def search_params
    params.permit(:id, :customer_id, :merchant_id, :created_at, :updated_at, :status)
  end

end
