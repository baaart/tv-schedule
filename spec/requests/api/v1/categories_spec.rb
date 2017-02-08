require 'spec_helper'

describe 'Categories endpoint' do
  it 'retrieves a list of categories' do
    FactoryGirl.create_list(:category, 10)

    get '/api/v1/categories'

    expect(response).to be_success
    expect(json.length).to eq(10)
  end

  it 'retrieves a single category' do
    category = FactoryGirl.create(:category)

    get "/api/v1/categories/#{category.id}"

    expect(response).to be_success
    expect(json['id']).to eq(category.id)
    expect(json['created_at']).to eq(nil)
  end

  it 'returnes 404 when id not found' do
    get '/api/v1/categories/111'

    expect(response.code).to eq('404')
  end
end
