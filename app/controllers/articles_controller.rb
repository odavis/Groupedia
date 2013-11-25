class ArticlesController < ApplicationController
  def index
    @articles = Article.all 
  end

  def show
    @article = Article.find(params[:article_id])
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.new 
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @article = current_user.article.build(params[:article])
    @article.wiki = @wiki 

    if @article.save
      flash[:notice] = "Article was saved"
      redired_to [@wiki, @article]
    else
      flash[L:error] = "Error saving Article"
      render :new 
    end
  end

  def edit
    @wiki = Wiki.find(params[:wiki_id])
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
