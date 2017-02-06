require 'rails_helper'

RSpec.describe Channel, type: :model do
  context 'associations' do
    it { should have_many :schedules }
    it { should have_many :shows }
  end

  context 'validations' do
    it { should validate_presence_of :name }
  end
end
