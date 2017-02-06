class Schedule < ApplicationRecord
  belongs_to :show
  belongs_to :channel

  validates :show, presence: true
  validates :channel, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
