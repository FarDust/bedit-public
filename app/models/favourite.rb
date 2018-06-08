class Favourite < ApplicationRecord
  belongs_to(:user)
  belongs_to(:post)

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

  def favourite?(user, post)
    if self.user == user && self.post == post
      true
    else
      false
    end
  end
end
