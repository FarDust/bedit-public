class Category < ApplicationRecord
  resourcify()
  has_many(:posts, dependent: :destroy)
  has_many(:subscriptions)
end
