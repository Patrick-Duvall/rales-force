require 'rails_helper'

describe "Invoice API Transaction " do
  it "sends a list of invoices transactions" do
    m1 = create(:merchant)
    it1 = create(:item, merchant_id: m1.id)
    c1 = create(:customer)
    inv1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    create_list(:invoice_item, 3, item_id: it1.id, invoice_id: inv1.id)

    get "/api/v1/invoices/#{inv1.id}/invoice_items"
    expect(response).to be_successful
     invoice_items = JSON.parse(response.body)
     expect(invoice_items['data'].count).to eq(3)
     expect(invoice_items['data'][0]['attributes']['invoice_id']).to eq(inv1.id)
   end
  end
