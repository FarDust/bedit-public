class Post < ApplicationRecord
  acts_as_votable() # Activate Vote
  resourcify() # Activate Roles
  belongs_to(:category)
  has_many(:favourites)
  has_many(:commentary)

  def subcribers
    favourites.length
  end
end
