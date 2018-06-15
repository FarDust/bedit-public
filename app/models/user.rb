class User < ApplicationRecord
  rolify

  after_create(:assign_default_role)

  devise(:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable)
  validates(:email, uniqueness: true)
  validates(:username, uniqueness: true)
  acts_as_voter()
  has_many(:publication)
  has_many(:commentaries)
  has_many(:favourites, dependent: :destroy)
  has_many(:post)
  has_many(:commentary)

  def assign_default_role
    add_role(:normal) if roles.blank?
  end
end
