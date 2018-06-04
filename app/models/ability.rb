class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role?(:admin)
      can(:manage, :all)
    else
      can(:read, :all)
      can(:write, Post, id: Post.with_role(:moderator, user).pluck(:id))
    end
  end
end
