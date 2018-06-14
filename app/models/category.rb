class Category < ApplicationRecord
  resourcify
  has_many(:posts, dependent: :destroy)
end
