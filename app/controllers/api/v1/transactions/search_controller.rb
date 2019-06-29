class Api::V1::Transactions::SearchController < ApplicationController
  def show
    if search_params && search_params != {}
      render json: TransactionSerializer.new(Transaction.find_by(search_params))
    else
      render json: MerchantSerializer.new(Merchant.random)
    end
  end


  def index
    render json: TransactionSerializer.new(Transaction.find_all(search_params))
  end

  private

  def search_params
    params.permit(:id, :created_at, :updated_at, :credit_card_number, :result, :invoice_id)
  end

end
