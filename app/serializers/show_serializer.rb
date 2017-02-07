class ShowSerializer < ActiveModel::Serializer
  attribute :name, key: 'title'
  attribute :description
  belongs_to :category
end
