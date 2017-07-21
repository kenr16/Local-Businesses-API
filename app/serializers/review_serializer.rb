class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :author, :price, :rating, :content
  has_one :shop
end
