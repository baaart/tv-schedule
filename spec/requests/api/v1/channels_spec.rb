require 'spec_helper'

describe 'Channels endpoint' do
  it 'retrieves a list of channels' do
    FactoryGirl.create_list(:channel, 10)

    get '/api/v1/channels'

    expect(response.status).to eq(200)
    expect(json.length).to eq(10)
  end

  it 'retrieves a single channel' do
    channel = FactoryGirl.create(:channel)

    get "/api/v1/channels/#{channel.id}"

    expect(response).to be_success
    expect(json['id']).to eq(channel.id)
    expect(json['created_at']).to eq(nil)
  end
end
