require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    m1 = create(:merchant)
    c1, c2 = create_list(:customer, 2)
    i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    i2 = create(:invoice, merchant_id: m1.id, customer_id: c2.id)
    create(:transaction, invoice_id: i1.id )
    create(:transaction, invoice_id: i2.id )
    create(:transaction, invoice_id: i1.id )

    get '/api/v1/transactions'
    expect(response).to be_successful

     items = JSON.parse(response.body)

     expect(items['data'].count).to eq(3)
  end

  it "can get one item by id" do
    m1 = create(:merchant)
    c1 = create(:customer)
    i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    id = create(:transaction, invoice_id: i1.id ).id
   get "/api/v1/transactions/#{id}"
   transaction = JSON.parse(response.body)
   expect(response).to be_successful
   expect(transaction['data']["id"].to_i).to eq(id)
 end
end
