class CollaborationsController < ApplicationController


  def new
    @collaboration = Collaboration.new 
  end

  def create
    # @wiki = Wiki.find(params[:wiki_id])
    # @collaboration = Collaboration.create(params[:collaboration])
    # email = @collaboration.email 
    # user = User.where(email: @collab.email)
    # user_id = user.id
    # @collaboration.update_attribute(:user_id, user_id)
    #@wiki = Wiki.find(params[:wiki_id])

    @wiki = Wiki.find(params[:wiki])
    @collaboration = Collaboration.create(params[:collaboration])
    @collaborations = Collaboration.all
    @email = @collaboration.email

    @collaboration.update_attribute(:wiki_id, 33)

    # Use case when email address is not found? 
    # should email that person inviting them to join blocipeida 

    if User.find_by_email(@email)
      user_id = User.find_by_email(@email).id
      @collaboration.update_attribute(:user_id, user_id)
    end

    if @collaboration.save
      flash[:notice] = "#{@email} added as collaborator"
      redirect_to wikis_path
    else
      flash[:error] = "Error adding #{@email} as collaborator "
      redirect_to wikis_path
    end
  end

  def destroy
    #@wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.find(params[:id])
    email = @collaboration.email

    if @collaboration.destroy
      flash[:notice] = "#{email} added as removed"
      redirect_to wikis_path
    else
      flash[:error] = "Error removing #{email} as collaborator "
      redirect_to wikis_path
    end
  end
  
end

