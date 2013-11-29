class Ability
  include CanCan::Ability

  def initialize(user)
   user ||= User.new 
    if user.role? :admin
        can :manage, :all
    end

    if user.role? :member 
        can :manage, Wiki
        can :manage, Article
    end

    #if user.role? :collaberator

    #end

    can :read, Wiki, public: true
  end
  
end


