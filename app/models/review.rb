class Review < ApplicationRecord
  belongs_to :shop, optional: true

  validates :author, presence: true
  validates :price, presence: true
  validates :rating, presence: true
  validates :content, presence: true
end
