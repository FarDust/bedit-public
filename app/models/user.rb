class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise(:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable)
  validates(:email, uniqueness: true)
  validates(:username, uniqueness: true)
  acts_as_voter()
  has_many(:publication)
  has_many(:favourites, dependent: :destroy)
end
