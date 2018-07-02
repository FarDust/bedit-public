class User < ApplicationRecord
  rolify()

  after_create(:assign_default_role)

  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :omniauthable,
    omniauth_providers: [:google_oauth2]
  )
  validates(:email, uniqueness: true)
  validates(:username, uniqueness: true)
  acts_as_voter()
  has_many(:publication)
  has_many(:commentaries)
  has_many(:favourites, dependent: :destroy)
  has_many(:posts)
  has_many(:commentary)
  has_many(:subscriptions)

  def reputation
    total_likes = 0
    total_dislikes = 0
    for commentary in Commentary.where(user: self) do
      total_likes += commentary.get_likes.size
      total_dislikes += commentary.get_dislikes.size
    end
    [(Math.exp(total_likes) - total_dislikes * Math.log([total_likes, 1].max())), 0].max()
  end

  def assign_default_role
    add_role(:normal) if roles.blank?
  end

  def moderator?
    response = false
    for category in Category.all.each do
      response = true if has_role?(:moderator, category)
    end
    response
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(
      username: data['name'],
      email: data['email'],
      password: Devise.friendly_token[0, 20],
      avatar: data['image'],
      provider: 'google'
    )
    user
  end
end
