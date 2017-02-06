class Channel < ApplicationRecord
  has_many :schedules
  has_many :shows, through: :schedules

  validates :name, presence: true
end
