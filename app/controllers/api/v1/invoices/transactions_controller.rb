class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    invoice = Invoice.find(params["id"])
    render json: TransactionSerializer.new(invoice.transactions)
  end
end
