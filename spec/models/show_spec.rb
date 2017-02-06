require 'rails_helper'

RSpec.describe Show, type: :model do
  context 'associations' do
    it { should belong_to :category }
    it { should have_many :schedules }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
end
