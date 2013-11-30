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
    authorize! :create, Article, message: "You need to be a member to create a new article"
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    #@article = current_user.wiki.articles.build(params[:article])
    @article = @wiki.articles.build(params[:article]) 
    #@article = current_user.wiki.articles.build(params[:article])
    #@article = current_user.articles.build(params[:article]) 
  #@article = current_user.articles.build(params[:article])

    @article.wiki = @wiki 

    #@post = current_user.posts.build(params[:post])
    #@post.topic = @topic

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
    authorize! :edit, @article, message: "You need to own the post to edit it"
  end

  def update
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])

    authorize! :update, @article, message: "You need to own the post to edit it"

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
    title = @article.title  

    authorize! :destroy, [@wiki, @article], message: "You must own this Article to delete"
    if @article.destroy
      flash[:notice] = "#{title} was deleted"
      redirect_to @wiki 
    else
      flash[:error] = "Error deleting #{title}"
      redirect_to [@wiki, @article]
    end
  end

end
