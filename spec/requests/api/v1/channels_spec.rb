require 'spec_helper'

describe 'Schedules API' do
  it 'retrieves a list of schedules' do
    FactoryGirl.create_list(:channel, 10)

    get '/api/v1/channels'

    expect(response.status).to eq(200)
    expect(json.length).to eq(10)
  end
end
