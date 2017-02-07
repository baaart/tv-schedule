class ChannelSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name, key: 'title'
end
