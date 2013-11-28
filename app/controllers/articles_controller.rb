class ArticlesController < ApplicationController
  def index
    @articles = Article.all 
  end

  def show
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.new 
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @article = @wiki.articles.build(params[:article]) 
    @article.wiki = @wiki 

    if @article.save
      flash[:notice] = "Article was saved"
      redirect_to [@wiki, @article]
    else
      flash[:error] = "Error saving Article"
      render :new 
    end
  end

  def edit
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      flash[:notice] = "Article updated"
      redirect_to [@wiki,@article]
    else
      flash[:error] = "Error updating Article"
      redirect_to [@wiki,@article] 
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])

    if @article.destroy
      flash[:notice] = "Topic deleted"
      redirect_to @wiki 
    else
      flash[:error] = "Error deleting post"
      redirect_to [@wiki, article]
    end
  end

end
