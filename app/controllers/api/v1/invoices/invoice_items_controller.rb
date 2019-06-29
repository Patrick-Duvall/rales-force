class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    require "pry"; binding.pry
    invoice = Invoice.find(params["id"])
    render json: InvoiceItemSerializer.new(invoice.invoice_items)
  end
end
