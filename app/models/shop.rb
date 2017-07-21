class Shop < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :hours, presence: true
end
