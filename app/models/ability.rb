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
        can :create, Article
        can :edit, Article 
        can :update, Article 
        can :create, Collaboration, :user_id => user.id 
       # can :manage, Article, :user.id => user.id
        #can :manage, Wiki, user.id => 
    end

    # if user.collaboration.role? :owner
    # can create new wiki
    # can edit wiki
    # can update wiki
    # can destroy wiki 
    # manage wiki  
    # end

    # if user.collaboration.role? :editor
      # can edit
      # can update
    # end

    # if user membership? :free
    # end

    # if user.membership? :paid
    # can create private accoutn 
    # end

    can :read, Wiki, privacy: false
  end
end


