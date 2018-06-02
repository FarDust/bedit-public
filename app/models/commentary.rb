class Commentary < ApplicationRecord
  acts_as_votable()
  # belongs_to(:post)
  belongs_to(:user)
  # http://http://railscasts.com/episodes/163-self-referential-association
  has_many(:replies)
  has_many(:responses, through: :replies)
  has_many(:inverse_replies, class_name: 'Reply', foreign_key: 'response_id')
  has_many(:inverse_responses, through: :inverse_replies, source: :commentary)

  after_commit :create_notifications, on: [:create]
  def create_notifications
    if !post_id.nil?
      to_nofify = Favourite.where(post: Post.find(post_id), isSubcribe: true)
      for subcrition in to_nofify do
        Notification.create(
          notify_type: 'comment',
          actor: user,
          user: subcrition.user,
          target: self
        )
      end
    else
      # Code for commentary of commentaries notifications
    end
  end
end
