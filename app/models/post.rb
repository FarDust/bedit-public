class Post < ApplicationRecord
  belongs_to(:category)
  has_many(:commentary, dependent: :destroy)
end
