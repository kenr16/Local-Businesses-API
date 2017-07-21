class Shop < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { in: 2..100 }

  validates :address, presence: true
  validates :address, length: { in: 2..150 }

  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  validates :url, presence: true
  validates :url, length: { in: 3..250 }

  validates :hours, presence: true
  validates :hours, length: { in: 3..150 }
end
