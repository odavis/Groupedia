class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
    @article = @wiki.articles
  end

  def new
    @wiki = Wiki.new 
    authorize! :create, @wiki, message: "You must be a member to create a new Wiki"
  end

  def create
    @wiki = Wiki.new(params[:wiki])

    authorize! :create, @wiki, message: "You must be a member to create a new Wiki"
    if @wiki.save 
      flash[:notice] = "Wiki created"
      redirect_to @wiki 
    else
      flash[:error] = "Wiki could not be created. Try again"
      render :new 
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize! :edit, @wiki, message: "You must own this Wiki to edit it"
  end

  def update
    @wiki = Wiki.find(params[:id])
    
    authorize! :update, @wiki, message: "You must own this Wiki to update it"

    if @wiki.update_attributes(:wiki)
      flash[:notice] = "Wiki updated"
      redirect_to @wiki
    else
      flash[:error] = "Error updating wiki"
      render :edit 
    end
  end

  def destroy

    @wiki = Wiki.find(params[:id])
    topic = @wiki.topic

    authorize! :destroy, @wiki, message: "You cannot delete this Wiki"
    if @wiki.destroy
      flash[:notice] = "#{topic} has been deleted"
      redirect_to [@wiki]
    else
      flash[:error] = "#{topic} could not be deleted"
      render :show 
    end
  end

end
