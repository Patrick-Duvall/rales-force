require 'rails_helper'

describe "customers API invoices" do
  it "sends a list of customers invoices" do
    m1 = create(:merchant)
    c1 = create(:customer)
    inv1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    t1, t2,t3 = create_list(:transaction, 3, invoice_id: inv1.id)

    get "/api/v1/customers/#{c1.id}/transactions"
    expect(response).to be_successful
     transactions = JSON.parse(response.body)
     expect(transactions['data'].count).to eq(3)
     expect(transactions['data'][0]['id']).to eq(t1.id.to_s)
   end
  end
