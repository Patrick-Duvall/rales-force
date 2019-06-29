class Api::V1::Transactions::InvoiceController < ApplicationController
  def show
    transaction = Transaction.find(params["id"])
    render json: InvoiceSerializer.new(transaction.invoice)
  end
end
