class Show < ApplicationRecord
  belongs_to :category
  has_many :schedules

  validates :name, presence: true
  validates :description, presence: true
end
