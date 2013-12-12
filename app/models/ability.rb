class Ability
  include CanCan::Ability

  def initialize(user)
   user ||= User.new 

    if user.role? :admin
        can :manage, :all
    end

    if user.role? :member 
        can :manage, Wiki, :user_id => user.id 
        can :edit, Wiki, :user_id => user.id
        can :create, Wiki 

        can :create, Article, :user_id => user.id
        can :edit, Article 
        can :update, Article 

        can :create, Collaboration, :user_id => user.id 
    end
    can :read, Wiki, privacy: false
  end
end


