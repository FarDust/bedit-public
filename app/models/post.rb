class Post < ApplicationRecord
  acts_as_votable() # Activate Vote
  resourcify() # Activate Roles
  belongs_to(:category)
  belongs_to(:user)
  has_many(:favourites)
  has_many(:commentary)

  def subcribers
    favourites.length
  end

  def points
    favourites.length * [1,(get_likes.size - get_dislikes.size)].max()
  end 

  def sort_by_points
    Post.all().sort_by do |x|
      x.points()
    end .reverse!
  end

  def sort_by_date
    Post.all().sort_by do |x|
      x.created_at
    end .reverse!
  end

  def sort_by_trends
    Post.all().sort_by do |x|
      x.points * 1 / [(Date.today - x.created_at),1].min()
    end .reverse!
  end
end
