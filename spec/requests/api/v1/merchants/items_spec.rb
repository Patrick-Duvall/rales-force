require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants items" do
    m1 = create(:merchant)
    create_list(:item, 3, merchant_id: m1.id)

    get "/api/v1/merchants/#{m1.id}/items"
    expect(response).to be_successful
     items = JSON.parse(response.body)
     expect(items['data'].count).to eq(3)
     expect(items['data'][0]['attributes']['merchant_id']).to eq(m1.id)
   end
  end
