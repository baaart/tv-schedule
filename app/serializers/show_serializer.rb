class ShowSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name, key: 'title'
  attribute :description
  belongs_to :category
end
