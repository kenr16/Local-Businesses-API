class Review < ApplicationRecord
  belongs_to :shop, optional: true

  validates :author, presence: true
  validates :author, length: { in: 3..100 }

  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :price, inclusion: { in: 1..5 }


  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5 }


  validates :content, presence: true
  validates :content, length: { in: 3..500 }
end
