require 'rails_helper'

describe "customers API invoices" do
  it "sends a list of customers invoices" do
    m1 = create(:merchant)
    c1 = create(:customer)
    create_list(:invoice, 3, merchant_id: m1.id, customer_id: c1.id)

    get "/api/v1/customers/#{c1.id}/invoices"
    expect(response).to be_successful
     items = JSON.parse(response.body)
     expect(items['data'].count).to eq(3)
     expect(items['data'][0]['attributes']['customer_id']).to eq(c1.id)
   end
  end
