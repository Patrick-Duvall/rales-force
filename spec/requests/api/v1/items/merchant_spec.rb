require 'rails_helper'

describe "item API merchant " do
  it "sends an items merchant" do
    m1 = create(:merchant)
    it1 = create(:item, merchant_id: m1.id)
    c1 = create(:customer)
    inv1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    invit1, invit2 = create_list(:invoice_item, 3, item_id: it1.id, invoice_id: inv1.id)

    get "/api/v1/invoices/#{inv1.id}/merchant"
    expect(response).to be_successful
     invoice_items = JSON.parse(response.body)
     expect(invoice_items['data']['attributes']['id']).to eq(m1.id)
   end
  end
