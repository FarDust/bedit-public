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

  def user
    if !super.user.nil?
      super
    else
      User.find(user_id)
    end
  end
  
  def post
    if !super.post.nil?
      super
    else
      User.find(post_id)
    end
  end
end
