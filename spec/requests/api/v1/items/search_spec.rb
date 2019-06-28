require "rails_helper"

describe "Items search API" do
  before :each do
    @m1 = create(:merchant)
    @i1 = create(:item, merchant_id: @m1.id)
  end

  it "can find one entry by ID" do
    id = @i1.id
    get "/api/v1/items/find?id=#{id}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data']["id"].to_i).to eq(id)
  end

  it "can find one entry by name" do
    name = @i1.name
    get "/api/v1/items/find?name=#{name}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data']['attributes']["name"]).to eq(name)
  end

  it "can find one entry by description" do
    description = @i1.description
    get "/api/v1/items/find?description=#{description}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data']['attributes']["description"]).to eq(description)
  end
  it "can find one entry by unit price" do
    unit_price = @i1.unit_price
    get "/api/v1/items/find?unit_price=#{unit_price}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data']['attributes']["unit_price"]).to eq(unit_price)
  end
  it "can find one entry by merchant id" do
    merchant_id = @i1.merchant_id
    get "/api/v1/items/find?merchant_id=#{merchant_id}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data']['attributes']["merchant_id"]).to eq(merchant_id)
  end

  it "can find one entry by created at" do
    item = create(:item, created_at: "2012-03-27T14:54:02.000Z", merchant_id: @m1.id, id: 33)
    created_at = item.created_at
    get "/api/v1/items/find?created_at=#{created_at}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data']['id']).to eq('33')
  end

  it "can find one entry by updated at" do
    item = create(:item, updated_at: "2012-03-27T14:54:02.000Z", id: 33, merchant_id: @m1.id)
    updated_at = item.updated_at
    get "/api/v1/items/find?updated_at=#{updated_at}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data']['id']).to eq('33')
  end

  xit "can find multiple entries by ID" do
    id = create(:item).id
    get "/api/v1/items/find_all?id=#{id}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data'][0]["id"].to_i).to eq(id)
  end

  xit "can find multiple entries by name" do
    name = create(:item).name
    get "/api/v1/items/find_all?name=#{name}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data'][0]['attributes']["name"]).to eq(name)
  end

  xit "can find multiple entries by name" do
    item = Merchant.create!(  {
      "id"         => 22,
      "name"       => "Quitzon and Sons",
      "created_at" => "2012-03-27T14:54:02.000Z",
      "updated_at" => "2012-03-27T14:54:02.000Z"
    })
    created_at = item.created_at
    get "/api/v1/items/find_all?created_at=#{created_at}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data'][0]['id']).to eq('22')
  end

  xit "can find multiple entries by name" do
    item = Merchant.create!(  {
      "id"         => 24,
      "name"       => "Quitzon and Sons",
      "created_at" => "2012-03-27T14:54:02.000Z",
      "updated_at" => "2012-03-27T14:54:02.000Z"
    })
    updated_at = item.updated_at
    get "/api/v1/items/find_all?updated_at=#{updated_at}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item['data'][0]['id']).to eq('24')
  end

  xit "can provide a random entry" do
    items = create_list(:item, 5)
    get "/api/v1/items/random"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(items.map(&:id)).to include(merchant["data"]["id"].to_i)
  end

end
