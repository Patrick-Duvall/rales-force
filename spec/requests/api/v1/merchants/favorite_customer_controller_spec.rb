require "rails_helper"

describe "Merchants favorite customer" do

  it "can find one entry by ID" do
    m1, m2 = create_list(:merchant, 2)
    c1, c2, c3, c4, c5 = create_list(:customer, 5)
    create(:invoice, merchant: m1, customer: c1)
    create(:invoice, merchant: m1, customer: c1)
    create(:invoice, merchant: m1, customer: c2)
    create(:invoice, merchant: m2, customer: c4)
    create(:invoice, merchant: m2, customer: c4)
    create(:invoice, merchant: m2, customer: c4)
    create(:invoice, merchant: m2, customer: c3)

    id1 = m1.id
    id2 = m2.id

    get "/api/v1/merchants/#{id1}/favorite_customer"
    customer = JSON.parse(response.body)
    expect(response).to (be_successful)
    expect(response["data"]['attributes']['first_name']).to eq(customer.first_name)

    get "/api/v1/merchants/#{id2}/favorite_customer"
    customer = JSON.parse(response.body)
    expect(response).to (be_successful)
    expect(response["data"]['attributes']['first_name']).to eq(customer.first_name)

  end
end
