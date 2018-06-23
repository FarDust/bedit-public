class Category < ApplicationRecord
  resourcify()
  has_many(:posts, dependent: :destroy)
  has_many(:subscriptions)

  def subcribers
    subscriptions.length
  end
end
