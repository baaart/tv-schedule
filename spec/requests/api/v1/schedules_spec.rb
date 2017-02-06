require 'spec_helper'

describe 'Schedules API' do
  it 'retrieves a list of schedules' do
    FactoryGirl.create_list(:schedule, 10)

    get '/api/v1/schedules'

    expect(response).to be_success
    expect(json['schedules'].length).to eq(10)
  end

  it 'retrieves a single schedule' do
    schedule = FactoryGirl.create(:schedule)

    get '/api/v1/schedules/#{schedule.id}'

    expect(response).to be_success
    expect(json['schedule']['channel']['id']).to eq(schedule.channel.id)
    expect(json['schedule']['created_at']).to eq(nil)
  end
end
