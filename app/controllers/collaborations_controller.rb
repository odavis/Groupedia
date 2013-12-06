class CollaborationsController < ApplicationController


  def new
    @collaboration = Collaboration.new 
  end

  def create
    #binding.pry
    # @wiki = Wiki.find(params[:wiki_id])
    # @collaboration = Collaboration.create(params[:collaboration])
    # email = @collaboration.email 
    # user = User.where(email: @collab.email)
    # user_id = user.id
    # @collaboration.update_attribute(:user_id, user_id)

    @collaborations = Collaboration.all
    @wiki = Wiki.find(params[:collaboration][:wiki_id])
    @collaboration = Collaboration.create(params[:collaboration])
    user = User.find_by_email(params[:collaboration][:email])

   


    # refactor email 
    # @wiki = Wiki.find(params[:collaboration][:user_email])
    # user.find_by_email 
    # avoid storing email on collaboration model 
    # Use case when email address is not found? 
    # should email that person inviting them to join blocipeida 

    if user
      @collaboration.update_attribute(:user_id, user.id)
    end

    if @collaboration.save
      if user.email
        flash[:notice] = "#{user.email} added as collaborator"
      end
      redirect_to :back
    else
      if user.email
        flash[:error] = "Error adding #{user.email} as collaborator"
      end
      redirect_to wikis_path
    end
  end

  def destroy
    #@wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.find(params[:id])
    email = @collaboration.email

    if @collaboration.destroy
      flash[:notice] = "#{email} added as removed"
      redirect_to :back
    else
      flash[:error] = "Error removing #{email} as collaborator "
      redirect_to :back
    end
  end
  
end

