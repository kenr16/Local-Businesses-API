class Review < ApplicationRecord
  belongs_to :shop, optional: true
end
