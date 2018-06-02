class Favourite < ApplicationRecord
  belongs_to(:user)
  belongs_to(:post)
  has_many(:notifications, dependent: :destroy)

  def user_id
    if !user.nil?
      user.id
    else
      super
    end
  end

  def post_id
    if !post.nil?
      post.id
    else
      super
    end
  end
end
