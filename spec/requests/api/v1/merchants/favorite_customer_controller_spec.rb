require "rails_helper"

describe "Merchants favorite customer" do

  it "can find one entry by ID" do
    m1, m2 = create_list(:merchant, 2)
    c1, c2, c3, c4, c5 = create_list(:customer, 5)
    in1 = create(:invoice, merchant: m1, customer: c1)
    in2 = create(:invoice, merchant: m1, customer: c1)
    in3 = create(:invoice, merchant: m1, customer: c2)
    in4 = create(:invoice, merchant: m2, customer: c4)
    in5 = create(:invoice, merchant: m2, customer: c4)
    in6 = create(:invoice, merchant: m2, customer: c4)
    in7 = create(:invoice, merchant: m2, customer: c3)

    t1 = create(:transaction, invoice_id: in1.id, result: "success")
    t2 = create(:transaction, invoice_id: in2.id, result: "success")
    t3 = create(:transaction, invoice_id: in3.id, result: "success")
    t4 = create(:transaction, invoice_id: in5.id, result: "success")
    t5 = create(:transaction, invoice_id: in4.id, result: "success")

    id1 = m1.id
    id2 = m2.id

    get "/api/v1/merchants/#{id1}/favorite_customer"
    customer = JSON.parse(response.body)
    expect(response).to (be_successful)

    expect(customer["data"]['attributes']['first_name']).to eq(c1.first_name)

    get "/api/v1/merchants/#{id2}/favorite_customer"
    customer = JSON.parse(response.body)
    expect(response).to (be_successful)

    expect(customer["data"]['attributes']['first_name']).to eq(c4.first_name)

  end
end
