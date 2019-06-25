describe "Merchants search API" do
  it "can find one entry by ID" do
    id = create(:merchant).id
    require "pry"; binding.pry
    get "/api/v1/merchants/find?id=#{id}"
    # require "pry"; binding.pry
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item["id"]).to eq(id)
  end
end
