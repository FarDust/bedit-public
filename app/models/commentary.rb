class Commentary < ApplicationRecord
  belongs_to(:post)
  belongs_to(:commentary)
  has_many(:commentary, as: :replies)
end
