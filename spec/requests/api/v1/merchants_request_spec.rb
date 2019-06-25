require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_successful

     items = JSON.parse(response.body)

     expect(items.count).to eq(3)
  end

  it "can get one item by id" do
   id = create(:merchant).id
   get "/api/v1/merchants/#{id}"
   item = JSON.parse(response.body)
   expect(response).to be_successful
   expect(item["id"]).to eq(id)
 end
end
