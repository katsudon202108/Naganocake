class Genre < ApplicationRecord
  has_many :items
  attachment :image
end
