require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many(:items) }
  it { should have_many(:invoices) }
  it { should have_many(:customers).through(:invoices) }

  it 'can find a favorite_customer' do
    m1, m2 = create_list(:merchant, 2)
    c1, c2, c3, c4, c5 = create_list(:customer, 5)
    in1 = create(:invoice, merchant: m1, customer: c1)
    in2 = create(:invoice, merchant: m1, customer: c1)
    in3 = create(:invoice, merchant: m1, customer: c2)
    in4 = create(:invoice, merchant: m2, customer: c4)
    in5 = create(:invoice, merchant: m2, customer: c4)
    in6 = create(:invoice, merchant: m2, customer: c3)

    t1 = create(:transaction, invoice_id: in1.id, result: "success")
    t2 = create(:transaction, invoice_id: in1.id, result: "success")
    t3 = create(:transaction, invoice_id: in3.id, result: "failed")
    t4 = create(:transaction, invoice_id: in3.id, result: "failed")
    t5 = create(:transaction, invoice_id: in3.id, result: "failed")

    t6 = create(:transaction, invoice_id: in4.id, result: "success")
    t7 = create(:transaction, invoice_id: in6.id, result: "success")
    t8 = create(:transaction, invoice_id: in6.id, result: "success")
    t9 = create(:transaction, invoice_id: in4.id, result: "failed")
    t10 = create(:transaction, invoice_id: in6.id, result: "failed")

    expect(m1.favorite_customer).to eq(c1)
    expect(m2.favorite_customer).to eq(c3)
  end
end
