require "rails_helper"

describe "Transactions search API" do

  it "can find one entry by ID" do
    m1 = create(:merchant)
    c1 = create(:customer)
    i1 = create(:invoice, merchant_id: m1.id, customer_id: c1.id)
    id = create(:transaction, invoice_id: i1.id ).id
    require "pry"; binding.pry
    get "/api/v1/transactions/find?id=#{id}"
    transaction = JSON.parse(response.body)
    expect(response).to be_successful
    expect(transaction['data']["id"].to_i).to eq(id)
  end

  xit "can find one entry by name" do
    name = create(:merchant).name
    get "/api/v1/merchants/find?name=#{name}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data']['attributes']["name"]).to eq(name)
  end

  xit "can find one entry by created at" do
    merchant = Merchant.create!(  {
      "id"         => 33,
      "name"       => "Quitzon and Sons",
      "created_at" => "2012-03-27T14:54:02.000Z",
      "updated_at" => "2012-03-27T14:54:02.000Z"
    })
    created_at = merchant.created_at
    get "/api/v1/merchants/find?created_at=#{created_at}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data']['id']).to eq('33')
  end

  xit "can find one entry by updated at" do
    merchant = Merchant.create!(  {
      "id"         => 22,
      "name"       => "Quitzon and Sons",
      "created_at" => "2012-03-27T14:54:02.000Z",
      "updated_at" => "2012-03-27T14:54:02.000Z"
    })
    updated_at = merchant.updated_at
    get "/api/v1/merchants/find?updated_at=#{updated_at}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data']['id']).to eq('22')
  end

  xit "can find multiple entries by ID" do
    id = create(:merchant).id
    get "/api/v1/merchants/find_all?id=#{id}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data'][0]["id"].to_i).to eq(id)
  end

  xit "can find multiple entries by name" do
    name = create(:merchant).name
    get "/api/v1/merchants/find_all?name=#{name}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data'][0]['attributes']["name"]).to eq(name)
  end

  xit "can find multiple entries by name" do
    merchant = Merchant.create!(  {
      "id"         => 22,
      "name"       => "Quitzon and Sons",
      "created_at" => "2012-03-27T14:54:02.000Z",
      "updated_at" => "2012-03-27T14:54:02.000Z"
    })
    created_at = merchant.created_at
    get "/api/v1/merchants/find_all?created_at=#{created_at}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data'][0]['id']).to eq('22')
  end

  xit "can find multiple entries by name" do
    merchant = Merchant.create!(  {
      "id"         => 24,
      "name"       => "Quitzon and Sons",
      "created_at" => "2012-03-27T14:54:02.000Z",
      "updated_at" => "2012-03-27T14:54:02.000Z"
    })
    updated_at = merchant.updated_at
    get "/api/v1/merchants/find_all?updated_at=#{updated_at}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data'][0]['id']).to eq('24')
  end

  xit "can provide a random entry" do
    merchants = create_list(:merchant, 5)
    get "/api/v1/merchants/random"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchants.map(&:id)).to include(merchant["data"]["id"].to_i)
  end

end
