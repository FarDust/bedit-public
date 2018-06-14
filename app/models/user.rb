class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise(:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable)
  validates(:email, uniqueness: true)
  validates(:username, uniqueness: true)
  acts_as_voter()
  has_many(:publication)

  has_many(:commentaries)
  has_many(:favourites, dependent: :destroy)
  has_many(:posts)
  has_many(:commentary)

  def reputation()
    total_likes = 0
    total_dislikes = 0
    for post in posts do
      total_likes += post.likes.size * 1.5
      total_dislikes += post.dislikes.size * 1.2
    end
    for commentary in commentaries do
      total_likes += commentary.likes.size
      total_dislikes += commentary.dislikes.size
    end
    Math.exp(total_likes) - total_dislikes*Math.log(total_dislikes)
  end
end
