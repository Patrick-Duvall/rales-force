require 'rails_helper'

describe "transactions API invoice " do
  it "sends a transactions invoice" do
    m1 = create(:merchant)
    c1 = create(:customer)
    inv1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    tr1 = create(:transaction, invoice_id: inv1.id )

    get "/api/v1/transactions/#{tr1.id}/invoice"
    expect(response).to be_successful
     invoice = JSON.parse(response.body)
     expect(invoice['data']['attributes']['id']).to eq(inv1.id)
   end
  end
