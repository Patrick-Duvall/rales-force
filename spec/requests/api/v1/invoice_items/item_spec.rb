
require 'rails_helper'

describe "Invoice_items API item " do
  it "sends a list of invoice_items item" do
    m1 = create(:merchant)
    it1 = create(:item, merchant_id: m1.id )
    c1 = create(:customer)
    inv1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    invit1 = create(:invoice_item, item_id: it1.id, invoice_id: inv1.id)


    get "/api/v1/invoice_items/#{invit1.id}/item"
    expect(response).to be_successful
     invoice = JSON.parse(response.body)

     expect(invoice['data']['id']).to eq(it1.id.to_s)
   end
  end
