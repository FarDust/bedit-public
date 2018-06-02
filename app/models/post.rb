class Post < ApplicationRecord
  belongs_to(:category)
  has_many(:commentary)
end
