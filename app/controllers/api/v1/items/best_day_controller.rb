class Api::V1::Items::BestDayController < ApplicationController
  def show
    item = Item.find(params["id"])
    render json: DateSerializer.new(item.best_day)
  end
end
