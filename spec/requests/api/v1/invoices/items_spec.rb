require 'rails_helper'

describe "Invoice API Transaction " do
  it "sends a list of invoices transactions" do
    m1 = create(:merchant)
    it1, it2, it3  = create_list(:item, 3, merchant_id: m1.id)
    c1 = create(:customer)
    inv1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    create(:invoice_item, item_id: it1.id, invoice_id: inv1.id)
    create(:invoice_item, item_id: it2.id, invoice_id: inv1.id)
    create(:invoice_item, item_id: it3.id, invoice_id: inv1.id)

    get "/api/v1/invoices/#{inv1.id}/items"
    expect(response).to be_successful
     items = JSON.parse(response.body)
     expect(items['data'].count).to eq(3)
     expect(items['data'][0]['attributes']['id']).to eq(it1.id)
   end
  end
