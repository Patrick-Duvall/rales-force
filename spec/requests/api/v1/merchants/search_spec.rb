describe "Merchants search API" do
  it "can find one entry by ID" do
    id = create(:merchant).id
    get "/api/v1/merchants/find?id=#{id}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data']["id"]).to eq(id)
  end
  it "can find one entry by name" do
    name = create(:merchant).name
    get "/api/v1/merchants/find?name=#{name}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data']['attributes']["name"]).to eq(name)
  end
end
