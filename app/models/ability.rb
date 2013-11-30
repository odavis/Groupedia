class Ability
  include CanCan::Ability

  def initialize(user)
   user ||= User.new 

    if user.role? :admin
        can :manage, :all
    end

    if user.role? :member 
        can :manage, Wiki, :user_id => user.id 
        can :create, Wiki 
       # can :manage, Article, :user.id => user.id

        #can :manage, Wiki, user.id => 
    end

    #if user.role? :collaberator

    #end

    can :read, Wiki, privacy: false
  end
  
end


