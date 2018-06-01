class Post < ApplicationRecord
  acts_as_votable()
  belongs_to(:category)
  has_many(:commentary, dependent: :destroy)
end
