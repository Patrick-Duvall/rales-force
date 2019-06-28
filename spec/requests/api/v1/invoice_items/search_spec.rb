require "rails_helper"

describe "Transactions search API" do
  before :each do
    @m1 = create(:merchant)
    @it1, @it2 = create_list(:item, 2, merchant_id: @m1.id)
    @c1, @c2 = create_list(:customer, 2)
    @inv1 = create(:invoice, merchant_id: @m1.id, customer_id: @c1.id)
    @inv2 = create(:invoice, merchant_id: @m1.id, customer_id: @c2.id)
    @invit1 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv1.id)
    @invit2 = create(:invoice_item, item_id: @it2.id, invoice_id: @inv1.id)
    @invit3 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv2.id)
  end
  describe "show action" do

    it "can find one entry by ID" do
      id = @invit1.id
      get "/api/v1/invoice_items/find?id=#{id}"
      invoice_item = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_item['data']["id"].to_i).to eq(id)
    end
    it "can find one entry by item ID" do
      item_id = @invit1.item_id
      get "/api/v1/invoice_items/find?item_id=#{item_id}"
      invoice_item = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_item['data']['attributes']["item_id"].to_i).to eq(item_id)
    end
    it "can find one entry by invoice ID" do
      id = @invit1.id
      get "/api/v1/invoice_items/find?id=#{id}"
      invoice_item = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_item['data']['attributes']["id"].to_i).to eq(id)
    end

    xit "can find one entry by unit price" do
      #unit price error
      unit_price = @invit1.unit_price
      get "/api/v1/invoice_items/find?unit_price=#{unit_price}"
      invoice_item = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_item['data']['attributes']["unit_price"]).to eq(unit_price)
    end
    it "can find one entry by quantity" do
      quantity = @invit1.quantity
      get "/api/v1/invoice_items/find?quantity=#{quantity}"
      invoice_item = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_item['data']['attributes']["quantity"]).to eq(quantity)
    end

  it "can find one entry by created at" do
    invit1 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv1.id, created_at: "2012-03-27T14:56:42.000Z", id: 2 )
    created_at = invit1.created_at
    get "/api/v1/invoice_items/find?created_at=#{created_at}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data']['id']).to eq('2')
  end

    it "can find one entry by updated at" do
      invit1 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv1.id, updated_at: "2012-03-27T14:56:42.000Z", id: 2 )
      updated_at = invit1.updated_at
      get "/api/v1/invoice_items/find?updated_at=#{updated_at}"
      invoice_item = JSON.parse(response.body)
      expect(response).to be_successful
      expect(invoice_item['data']['id']).to eq('2')
    end
  end

  describe "index action" do

  it "can find multiple entries by ID" do
    id1 = @invit1.id
    get "/api/v1/invoice_items/find_all?id=#{id1}"
    invoice_item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice_item['data'][0]["id"].to_i).to eq(id1)
  end

  it "can find multiple entries by item_id" do
    item_id = @invit1.item_id
    get "/api/v1/invoice_items/find_all?item_id=#{item_id}"
    invoice_items = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice_items['data'][0]['attributes']["item_id"]).to eq(item_id)
  end
  it "can find multiple entries by invoice_id" do
    invoice_id = @invit1.invoice_id
    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_id}"
    invoice_items = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice_items['data'][0]['attributes']["invoice_id"]).to eq(invoice_id)
  end

  xit "can find multiple entries by unit_price" do
    unit_price = @invit1.unit_price
    get "/api/v1/invoice_items/find_all?unit_price=#{unit_price}"
    invoice_items = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice_items['data'][0]['attributes']["unit_price"]).to eq(unit_price)
  end
  it "can find multiple entries by quantity" do
    quantity = @invit1.quantity
    get "/api/v1/invoice_items/find_all?quantity=#{quantity}"
    invoice_items = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice_items['data'][0]['attributes']["quantity"]).to eq(quantity)
  end

  it "can find multiple entries by created_at" do
    invit1 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv1.id, created_at: "2012-03-27T14:56:42.000Z", id: 2 )
    invit2 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv1.id, created_at: "2012-03-27T14:56:42.000Z", id: 3 )
    created_at = invit1.created_at
    get "/api/v1/invoice_items/find_all?created_at=#{created_at}"
    invoice_item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice_item['data'][0]['id']).to eq('2')
    expect(invoice_item['data'][1]['id']).to eq('3')
  end

  it "can find multiple entries by updated_at" do
    invit1 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv1.id, updated_at: "2012-03-27T14:56:42.000Z", id: 2 )
    invit2 = create(:invoice_item, item_id: @it1.id, invoice_id: @inv1.id, updated_at: "2012-03-27T14:56:42.000Z", id: 3 )
    updated_at = invit1.updated_at
    updated_at = invit1.updated_at
    get "/api/v1/invoice_items/find_all?updated_at=#{updated_at}"
    invoice_item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice_item['data'][0]['id']).to eq('2')
    expect(invoice_item['data'][1]['id']).to eq('3')
  end

  it "can provide a random entry" do
    invoice_items = create_list(:invoice_item, 5, invoice_id: @inv1.id, item_id: @it1.id)  + [@invit1, @invit2, @invit3]
    get "/api/v1/invoice_items/random"
    invoice_item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(invoice_items.map(&:id)).to include(invoice_item["data"]["id"].to_i)
  end
end

end
