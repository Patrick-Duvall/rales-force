class Api::V1::Items::InvoiceItemsController < ApplicationController
  def index
    item = Item.find(params["id"])
    render json: InvoiceItemSerializer.new(item.invoice_items)
  end
end
