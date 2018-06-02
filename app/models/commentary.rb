class Commentary < ApplicationRecord
  # belongs_to(:post)
  belongs_to(:user)
  # http://http://railscasts.com/episodes/163-self-referential-association
  has_many(:replies)
  has_many(:responses, through: :replies)
  has_many(:inverse_replies, class_name: 'Reply', foreign_key: 'response_id')
  has_many(:inverse_responses, through: :inverse_replies, source: :commentary)
end
