require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    m1 = create(:merchant)
    create_list(:item, 3, merchant_id: m1.id)

    get '/api/v1/items'
    expect(response).to be_successful

     items = JSON.parse(response.body)

     expect(items['data'].count).to eq(3)
  end

  it "can get one item by id" do
  m1 = create(:merchant)
   id = create(:item, merchant_id: m1.id).id
   get "/api/v1/items/#{id}"
   item = JSON.parse(response.body)
   expect(response).to be_successful
   expect(item['data']["id"].to_i).to eq(id)
 end
end
