class CollaborationsController < ApplicationController
  def new
    @collaboration = Collaboration.new 
  end

  def create
    @collaborations = Collaboration.all
    @wiki = Wiki.find(params[:collaboration][:wiki_id])
    user = User.find_by_email(params[:collaboration][("email")])

    if user
      @collaboration = Collaboration.create(params[:collaboration])
      @collaboration.user_id = user.id 
    else
      new_user = User.invite!(email: params[:collaboration][("email")])
      @collaboration = Collaboration.create(params[:collaboration])
      @collaboration.user_id = new_user.id
    end

    email = @collaboration.email 
   
    if @collaboration.save
      flash[:notice] = "#{email} added as collaborator"
      redirect_to :back
    else
      flash[:error] = "Error adding #{email} as collaborator"
      redirect_to :back
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

