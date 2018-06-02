class Commentary < ApplicationRecord
  acts_as_votable()
  belongs_to(:user)

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
