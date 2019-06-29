require 'rails_helper'

describe "Invoice API Transaction " do
  it "sends a list of invoices transactions" do
    m1 = create(:merchant)
    c1 = create(:customer)
    i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    create_list(:transaction, 3, invoice_id: i1.id)

    get "/api/v1/invoices/#{i1.id}/transactions"
    expect(response).to be_successful
     items = JSON.parse(response.body)
     expect(items['data'].count).to eq(3)
     expect(items['data'][0]['attributes']['invoice_id']).to eq(i1.id)
   end
  end
