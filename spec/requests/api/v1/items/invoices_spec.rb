require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants items" do
    m1 = create(:merchant)
    it1 = create(:item, merchant_id: m1.id)
    c1 = create(:customer)
    inv1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    invit1, invit2, invit3, = create_list(:invoice_item, 3, item_id: it1.id, invoice_id: inv1.id)

    get "/api/v1/items/#{it1.id}/invoice_items"
    expect(response).to be_successful
     items = JSON.parse(response.body)
     expect(items['data'].count).to eq(3)
     expect(items['data'][0]['attributes']['id']).to eq(invit1.id)
   end
  end
