require 'rails_helper'

describe "Transactions API" do
  before :each do
    @m1 = create(:merchant)
    @it1, @it2 = create_list(:item, 2, merchant_id: @m1.id)
    @c1, @c2 = create_list(:customer, 2)
    @inv1 = create(:invoice, merchant_id: @m1.id, customer_id: @c1.id)
    @inv2 = create(:invoice, merchant_id: @m1.id, customer_id: @c2.id)
    @invit1 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv1.id)
    @invit2 = create(:invoice_item, item_id: @it2.id, invoice_id: @inv1.id)
    @invit3 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv2.id)
  end
  it "sends a list of transactions" do

    get '/api/v1/invoice_items'
    expect(response).to be_successful

     items = JSON.parse(response.body)

     expect(items['data'].count).to eq(3)
  end

  it "can get one item by id" do
    id = @invit1.id
   get "/api/v1/invoice_items/#{id}"
   transaction = JSON.parse(response.body)
   expect(response).to be_successful
   expect(transaction['data']["id"].to_i).to eq(id)
 end
end
