require 'spec_helper'

describe 'Schedules API' do
  it 'retrieves a list of schedules' do
    FactoryGirl.create_list(:schedule, 10)

    get '/api/v1/schedules'

    expect(response).to be_success
    expect(json.length).to eq(10)
  end

  it 'retrieves a single schedule' do
    schedule = FactoryGirl.create(:schedule)

    get "/api/v1/schedules/#{schedule.id}"

    expect(response).to be_success
    expect(json['channel']['id']).to eq(schedule.channel.id)
    expect(json['created_at']).to eq(nil)
  end

  it 'returnes 404 when id not found' do
    get '/api/v1/schedules/111'

    expect(response.code).to eq('404')
  end
end
