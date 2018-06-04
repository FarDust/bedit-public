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

    #can :read, :all . # permissions for every user, even if not logged in
    #if user.present?  # additional permissions for logged in users (they can manage their posts)
    #  can :manage, Post, user_id: user.id
    #  if user.admin?  # additional permissions for administrators
    #    can :manage, :all
    #  end
    #end

  end
end
