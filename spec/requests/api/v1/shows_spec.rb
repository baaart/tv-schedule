require 'spec_helper'

describe 'Shows endpoint' do
  it 'retrieves a list of shows' do
    FactoryGirl.create_list(:show, 10)

    get '/api/v1/shows'

    expect(response).to be_success
    expect(json.length).to eq(10)
  end

  it 'retrieves a single show' do
    show = FactoryGirl.create(:show)

    get "/api/v1/shows/#{show.id}"

    expect(response).to be_success
    expect(json['id']).to eq(show.id)
    expect(json['created_at']).to eq(nil)
  end
end
