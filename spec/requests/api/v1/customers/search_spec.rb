require "rails_helper"

describe "Merchants search API" do

  it "can find one entry by ID" do
    id = create(:customer).id
    get "/api/v1/customers/find?id=#{id}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data']["id"].to_i).to eq(id)
  end

  it "can find one entry by first name" do
    name = create(:customer).first_name
    get "/api/v1/customers/find?name=#{name}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data']['attributes']["first_name"]).to eq(name)
  end
  it "can find one entry by last name" do
    name = create(:customer).last_name
    get "/api/v1/customers/find?name=#{name}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data']['attributes']["last_name"]).to eq(name)
  end

  it "can find one entry by created at" do
    customer = Customer.create!(  {
      "id"         => 33,
      "created_at" => "2012-03-27T14:54:02.000Z",
    })
    created_at = customer.created_at
    get "/api/v1/customers/find?created_at=#{created_at}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data']['id']).to eq('33')
  end

  it "can find one entry by updated at" do
    customer = Customer.create!(  {
      "id"         => 22,
      "updated_at" => "2012-03-27T14:54:02.000Z"
    })
    updated_at = customer.updated_at
    get "/api/v1/customers/find?updated_at=#{updated_at}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data']['id']).to eq('22')
  end

  it "can find multiple entries by ID" do
    id = create(:customer).id
    get "/api/v1/customers/find_all?id=#{id}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data'][0]["id"].to_i).to eq(id)
  end

  it "can find multiple entries by first name" do
    name = create(:customer).first_name
    get "/api/v1/customers/find_all?name=#{name}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data'][0]['attributes']["first_name"]).to eq(name)
  end
  it "can find multiple entries by last name" do
    name = create(:customer).last_name
    get "/api/v1/customers/find_all?name=#{name}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data'][0]['attributes']["last_name"]).to eq(name)
  end

  it "can find multiple entries by name" do
    customer = Customer.create!(  {
      "id"         => 22,
      "created_at" => "2012-03-27T14:54:02.000Z"
    })
    created_at = customer.created_at
    get "/api/v1/customers/find_all?created_at=#{created_at}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data'][0]['id']).to eq('22')
  end

  it "can find multiple entries by name" do
    customer = Customer.create!(  {
      "id"         => 24,
      "updated_at" => "2012-03-27T14:54:02.000Z"
    })
    updated_at = customer.updated_at
    get "/api/v1/customers/find_all?updated_at=#{updated_at}"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer['data'][0]['id']).to eq('24')
  end

  it "can provide a random entry" do
    customers = create_list(:customer, 5)
    get "/api/v1/customers/random"
    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customers.map(&:id)).to include(customer["data"]["id"].to_i)
  end

end
