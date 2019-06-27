require "rails_helper"

describe "Transactions search API" do
  before :each do
    @m1 = create(:merchant)
    @c1 = create(:customer)
    @i1 = create(:invoice, merchant_id: @m1.id, customer_id: @c1.id)
    @t1 = create(:transaction, invoice_id: @i1.id )
  end
  describe "show action" do

    xit "can find one entry by ID" do
      id = @t1.id
      get "/api/v1/transactions/find?id=#{id}"
      transaction = JSON.parse(response.body)
      expect(response).to be_successful
      expect(transaction['data']["id"].to_i).to eq(id)
    end

    xit "can find one entry by credit card number" do
      card_number = @t1.credit_card_number
      get "/api/v1/transactions/find?credit_card_number=#{card_number}"
      transaction = JSON.parse(response.body)
      expect(response).to be_successful
      expect(transaction['data']['attributes']["credit_card_number"]).to eq(card_number)
    end
    xit "can find one entry by result" do
      result = @t1.result
      get "/api/v1/transactions/find?result=#{result}"
      transaction = JSON.parse(response.body)
      expect(response).to be_successful
      expect(transaction['data']['attributes']["result"]).to eq(result)
    end

  xit "can find one entry by created at" do
    t1 = create(:transaction, invoice_id: @i1.id, created_at: "2012-03-27T14:56:42.000Z", id: 2 )
    created_at = t1.created_at
    get "/api/v1/transactions/find?created_at=#{created_at}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data']['id']).to eq('2')
  end

    xit "can find one entry by updated at" do
      t1 = create(:transaction, invoice_id: @i1.id, updated_at: "2012-03-27T14:56:42.000Z", id: 2 )
      updated_at = t1.updated_at
      get "/api/v1/transactions/find?updated_at=#{updated_at}"
      transaction = JSON.parse(response.body)
      expect(response).to be_successful
      expect(transaction['data']['id']).to eq('2')
    end
  end

  describe "index action" do

  xit "can find multiple entries by ID" do
    id1 = @t1.id
    get "/api/v1/transactions/find_all?id=#{id1}"
    transaction = JSON.parse(response.body)
    expect(response).to be_successful
    expect(transaction['data'][0]["id"].to_i).to eq(id1)
  end

  xit "can find multiple entries by credit_card_number" do
    credit_card_number = @t1.credit_card_number
    get "/api/v1/transactions/find_all?credit_card_number=#{credit_card_number}"
    transactions = JSON.parse(response.body)
    expect(response).to be_successful
    expect(transactions['data'][0]['attributes']["credit_card_number"]).to eq(credit_card_number)
  end

  xit "can find multiple entries by result" do
    result = @t1.result
    get "/api/v1/transactions/find_all?result=#{result}"
    transactions = JSON.parse(response.body)
    expect(response).to be_successful
    expect(transactions['data'][0]['attributes']["result"]).to eq(result)
  end

  xit "can find multiple entries by created_at" do
    t1 = create(:transaction, invoice_id: @i1.id, created_at: "2012-03-27T14:56:42.000Z", id: 2 )
    t2 = create(:transaction, invoice_id: @i1.id, created_at: "2012-03-27T14:56:42.000Z", id: 3 )
    created_at = t1.created_at
    get "/api/v1/transactions/find_all?created_at=#{created_at}"
    transaction = JSON.parse(response.body)
    expect(response).to be_successful
    expect(transaction['data'][0]['id']).to eq('2')
    expect(transaction['data'][1]['id']).to eq('3')
  end

  xit "can find multiple entries by updated_at" do
    t1 = create(:transaction, invoice_id: @i1.id, updated_at: "2012-03-27T14:56:42.000Z", id: 2 )
    t2 = create(:transaction, invoice_id: @i1.id, updated_at: "2012-03-27T14:56:42.000Z", id: 3 )
    updated_at = t1.updated_at
    get "/api/v1/transactions/find_all?updated_at=#{updated_at}"
    transaction = JSON.parse(response.body)
    expect(response).to be_successful
    expect(transaction['data'][0]['id']).to eq('2')
    expect(transaction['data'][1]['id']).to eq('3')
  end

  it "can provide a random entry" do
    transactions = create_list(:transaction, 5, invoice_id: @i1.id) << @t1
    get "/api/v1/transactions/random"
    transaction = JSON.parse(response.body)
    expect(response).to be_successful
    expect(transactions.map(&:id)).to include(transaction["data"]["id"].to_i)
  end
end

end
