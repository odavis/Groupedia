class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
    @article = Article.find(params[:article_id])
  end

  def new
    @wiki = Wiki.new 
  end

  def create
    @wiki = Wiki.new(params[:wiki])
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
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(:wiki)
      flash[:notice] = "Wiki updated"
      redirect_to @wiki
    else
      flash[:error] = "Errow updating wiki"
      render :edit 
    end
  end

  def destroy
  end

end
