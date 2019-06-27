require "rails_helper"

describe "Merchants most revenue for x merchants API" do

  xit "can find one entry by ID" do
    get '/api/v1/merchants/most_revenue?quantity=5'
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(response["data"]).count.to eq(5)
  end

end
