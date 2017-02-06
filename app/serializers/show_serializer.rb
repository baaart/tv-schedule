class ShowSerializer < ActiveModel::Serializer
  attributes :name, :description
  belongs_to :category
end
