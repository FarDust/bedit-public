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
    subcribers * [1, (get_likes.size - get_dislikes.size)].max()
  end

  def sort_by_points
    self.sort_by(&:points).reverse!
  end

  def sort_by_date
    self.all().sort_by(&:created_at).reverse!
  end

  def sort_by_trends
    self.sort_by do |x|
      x.points() / [(Date.today.to_time.to_i - x.created_at.to_time.to_i)**2, 1].min()
    end .reverse!
  end

  def self.sort_by_points
    Post.all().sort_by(&:points).reverse!
  end

  def self.sort_by_date
    Post.all().sort_by(&:created_at).reverse!
  end

  def self.sort_by_trends
    Post.all().sort_by do |x|
      x.points() / [(Date.today.to_time.to_i - x.created_at.to_time.to_i)**2, 1].min()
    end .reverse!
  end
end
