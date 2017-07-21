class ShopSerializer < ActiveModel::Serializer
  attributes :name, :address, :description, :url, :hours
  # has_many :reviews
  # This line disabled for readability on the recipient's end.
end
