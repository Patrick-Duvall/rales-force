class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    if search_params && search_params != {}
      render json: InvoiceItemSerializer.new(InvoiceItem.find_by(search_params))
    else
      random = InvoiceItem.pluck(:id).sample
      render json: InvoiceItemSerializer.new(InvoiceItem.find(random))
    end
  end


  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.find_all(search_params))
  end

  private

  def search_params
    terms = params.permit(:id, :created_at, :updated_at, :quantity, :unit_price, :item_id, :invoice_id)
    terms['unit_price'] = terms['unit_price'].gsub(".", '') if terms['unit_price']
    terms
  end
end
