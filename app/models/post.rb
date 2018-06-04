class Post < ApplicationRecord
  acts_as_votable()
  resourcify()
  belongs_to(:category)
  has_many(:favourites)
  has_many(:commentary)
end
