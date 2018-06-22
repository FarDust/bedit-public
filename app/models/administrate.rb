class Administrate < ApplicationRecord
  acts_as_votable()

  def create_notifications(actor)
    Notification.create(notify_type: 'moderator',
                        actor: actor,
                        user: User.find_by(username: user),
                        target: self)
    # Code for commentary of commentaries notifications
  end
end
