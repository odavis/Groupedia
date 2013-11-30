class CollaboratorsController < ApplicationController



  def index
    @collaborator = Collaborator.all 
  end

  def show
  end

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.create(params[:collaborator])
    email = @collaborator.email 

    if @collaborator.save
      flash[:notice] = "#{email} added as collaborator"
      redirect_to wikis_path
    else
      flash[:error] = "#{email} could not be added"
      redirect_to wikis_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
