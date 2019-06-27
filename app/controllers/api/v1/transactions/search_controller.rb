class Api::V1::Transactions::SearchController < ApplicationController
  def show
    if params['id']
      require "pry"; binding.pry
      render json: TransactionSerializer.new(Transaction.find(params['id']))
    # elsif params['name']
    #   render json: MerchantSerializer.new(Merchant.find_by(name: params['name']))
    # elsif params['created_at']
    #   render json: MerchantSerializer.new(Merchant.find_by(created_at: params['created_at']))
    # elsif params['updated_at']
    #   render json: MerchantSerializer.new(Merchant.find_by(created_at: params['updated_at']))
    # else
    #   random = Merchant.pluck(:id).sample
    #   render json: MerchantSerializer.new(Merchant.find(random))
    end
  end

  def index
    if params['id']
      render json: MerchantSerializer.new(Merchant.where(id: params[:id]))
    end
    # if params['name']
    #   render json: MerchantSerializer.new(Merchant.where(name: params[:name]))
    # end
    # if params['created_at']
    #   render json: MerchantSerializer.new(Merchant.where(created_at: params[:created_at]))
    # end
    # if params['updated_at']
    #   render json: MerchantSerializer.new(Merchant.where(updated_at: params[:updated_at]))
    # end
  end
end
