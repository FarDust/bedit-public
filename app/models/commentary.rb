class Commentary < ApplicationRecord
  belongs_to(:post)
  belongs_to(:commentary, class_name: 'Commentary', dependent: :destroy)
  has_many(:commentary, class_name: 'Commentary', as: :replies)
end
