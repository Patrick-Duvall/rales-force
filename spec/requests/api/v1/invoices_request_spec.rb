require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    m1 = create(:merchant)
    c1 = create(:customer)
    create_list(:invoice, 3, customer_id: c1.id, merchant_id: m1.id)
    get '/api/v1/invoices'
    expect(response).to be_successful

     items = JSON.parse(response.body)

     expect(items['data'].count).to eq(3)
  end

  it "can get one item by id" do
    m1 = create(:merchant)
    c1 = create(:customer)
    id = create(:invoice, customer_id: c1.id, merchant_id: m1.id).id
   get "/api/v1/invoices/#{id}"
   invoice = JSON.parse(response.body)
   expect(response).to be_successful
   expect(invoice['data']["id"].to_i).to eq(id)
 end
end
