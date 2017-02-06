class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time
  belongs_to :channel
  belongs_to :show
end
