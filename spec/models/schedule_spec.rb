require 'rails_helper'

RSpec.describe Schedule, type: :model do
  context 'associations' do
    it { should belong_to :show }
    it { should belong_to :channel }
  end

  context 'validations' do
    it { should validate_presence_of :show }
    it { should validate_presence_of :channel }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
  end
end
