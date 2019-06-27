class Api::V1::Transactions::SearchController < ApplicationController
  def show
    render json: TransactionSerializer.new(Transaction.find_by(search_params))
  end


  def index
  end

  private

  def search_params
    params.permit(:id, :created_at, :updated_at, :credit_card_number, :result)
  end

end
