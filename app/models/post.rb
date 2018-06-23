class Post < ApplicationRecord
  acts_as_votable() # Activate Vote
  resourcify() # Activate Roles
  belongs_to(:category, dependent: :destroy)
  belongs_to(:user)
  has_many(:favourites)
  has_many(:commentary)

  after_commit(:create_notifications, on: [:create])

  def create_notifications
    to_nofify = Subscription.where(category: category)
    for subcrition in to_nofify do
      next if subcrition.user == user
      Notification.create(
        notify_type: 'new_post',
        actor: user,
        user: subcrition.user,
        target: self
      )
    end
  end

  def subcribers
    favourites.length
  end

  def points
    subcribers * [1, (get_likes.size - get_dislikes.size)].max()
  end

  def relevance
    points() / [(Date.today.to_time.to_i - created_at.to_time.to_i)**2, 1].min()
  end

  def self.sort_by_points(posts)
    posts.sort_by(&:points).reverse!
  end

  def self.sort_by_date(posts)
    posts.order(created_at: :desc)
  end

  def self.sort_by_trends(posts)
    posts.sort_by(&:relevance).reverse!
  end
end
