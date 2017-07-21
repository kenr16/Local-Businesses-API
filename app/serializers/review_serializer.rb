class ReviewSerializer < ActiveModel::Serializer
  attributes :author, :price, :rating, :content
  # has_one :shop
  # This is removed to prevent display problems when interpreting the data
end
