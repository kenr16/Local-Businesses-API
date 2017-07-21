class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :description, :url, :hours
end
