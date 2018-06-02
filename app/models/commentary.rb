class Commentary < ApplicationRecord
  belongs_to(:post)
  belongs_to(:user)
  # http://http://railscasts.com/episodes/163-self-referential-association
  has_many(:replys)
  has_many(:replies, through: :replys)
  has_many(:inverse_replys, class_name: "Reply", foreign_key: "reply_id")
  has_many(:inverse_replies, through: :inverse_replys, source: :commentary)
end
