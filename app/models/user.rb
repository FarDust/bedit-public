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
    for commentary in Commentary.where(user: self) do
      total_likes += commentary.get_likes.size
      total_dislikes += commentary.get_dislikes.size
    end
    [(Math.exp(total_likes) - total_dislikes * Math.log(total_likes)), 0].max()
  end
end
