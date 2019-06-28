require "rails_helper"

describe "Transactions search API" do
  before :each do
    @m1 = create(:merchant)
    @c1 = create(:customer)
    @i1 = create(:invoice, merchant_id: @m1.id, customer_id: @c1.id)
    # @t1 = create(:transaction, invoice_id: @i1.id )
  end
  describe "show action" do

    it "can find one entry by ID" do
      id = @i1.id
      get "/api/v1/invoices/find?id=#{id}"
      invoice = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice['data']["id"].to_i).to eq(id)
    end

    it "can find one entry by status" do
      status = @i1.status
      get "/api/v1/invoices/find?status=#{status}"
      invoice = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice['data']['attributes']["status"]).to eq(status)
    end
    it "can find one entry by merchant_id" do
      result = @i1.merchant_id
      get "/api/v1/invoices/find?merchant_id=#{result}"
      invoice = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice['data']['attributes']["merchant_id"]).to eq(result)
    end

  it "can find one entry by created at" do
    i1 = create(:invoice, customer_id: @c1.id, merchant_id: @m1.id, created_at: "2012-03-27T14:56:42.000Z", id: 2 )
    created_at = i1.created_at
    get "/api/v1/invoices/find?created_at=#{created_at}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data']['id']).to eq('2')
  end

    it "can find one entry by updated at" do
        i1 = create(:invoice, customer_id: @c1.id, merchant_id: @m1.id, updated_at: "2012-03-27T14:56:42.000Z", id: 2 )
      updated_at = i1.updated_at
      get "/api/v1/invoices/find?updated_at=#{updated_at}"
      invoice = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice['data']['id']).to eq('2')
    end
  end

  describe "index action" do

  it "can find multiple entries by ID" do
    id1 = @i1.id
    get "/api/v1/invoices/find_all?id=#{id1}"
    invoice = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice['data'][0]["id"].to_i).to eq(id1)
  end

  it "can find multiple entries by status" do
    status = @i1.status
    get "/api/v1/invoices/find_all?status=#{status}"
    invoices = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoices['data'][0]['attributes']["status"]).to eq(status)
  end

  it "can find multiple entries by merchant_id" do
    merchant_id = @i1.merchant_id
    get "/api/v1/invoices/find_all?merchant_id=#{merchant_id}"
    invoices = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoices['data'][0]['attributes']["merchant_id"]).to eq(merchant_id)
  end

  it "can find multiple entries by customer_id" do
    customer_id = @i1.customer_id
    get "/api/v1/invoices/find_all?customer_id=#{customer_id}"
    invoices = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoices['data'][0]['attributes']["customer_id"]).to eq(customer_id)
  end

  it "can find multiple entries by created_at" do
    i1 = create(:invoice, customer_id: @c1.id, merchant_id: @m1.id, created_at: "2012-03-27T14:56:42.000Z", id: 2 )
      i2 = create(:invoice, customer_id: @c1.id, merchant_id: @m1.id, created_at: "2012-03-27T14:56:42.000Z", id: 3 )
    created_at = i1.created_at
    get "/api/v1/invoices/find_all?created_at=#{created_at}"
    invoice = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice['data'][0]['id']).to eq('2')
    expect(invoice['data'][1]['id']).to eq('3')
  end

  it "can find multiple entries by updated_at" do
    i1 = create(:invoice, customer_id: @c1.id, merchant_id: @m1.id, updated_at: "2012-03-27T14:56:42.000Z", id: 2 )
      i2 = create(:invoice, customer_id: @c1.id, merchant_id: @m1.id, updated_at: "2012-03-27T14:56:42.000Z", id: 3 )
    updated_at = i1.updated_at
    get "/api/v1/invoices/find_all?updated_at=#{updated_at}"
    invoice = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice['data'][0]['id']).to eq('2')
    expect(invoice['data'][1]['id']).to eq('3')
  end

  it "can provide a random entry" do
    invoices = create_list(:invoice, 5, customer_id: @c1.id, merchant_id: @m1.id) << @i1
    get "/api/v1/invoices/random"
    invoice = JSON.parse(response.body)
    require "pry"; binding.pry
    expect(response).to be_successful
    expect(invoices.map(&:id)).to include(invoice["data"]["id"].to_i)
  end
end

end
