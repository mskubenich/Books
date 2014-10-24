class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.user?
      can :read, :all
      can :manage, Book
    end
  end
end
