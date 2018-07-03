class Category < ApplicationRecord
  resourcify()
  has_many(:posts, dependent: :destroy)
  has_many(:subscriptions)
  has_one(:background)

  def subcribers
    subscriptions.length
  end

  def background?
    !background.nil?
  end
end
