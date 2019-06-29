require 'rails_helper'

describe "Invoice API Transaction " do
  it "sends a list of invoices transactions" do
    m1 = create(:merchant)
    c1 = create(:customer)
    inv1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)

    get "/api/v1/invoices/#{inv1.id}/customer"
    expect(response).to be_successful
     invoice_items = JSON.parse(response.body)
     expect(invoice_items['data']['attributes']['id']).to eq(c1.id)
   end
  end
