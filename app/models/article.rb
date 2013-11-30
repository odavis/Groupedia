class Article < ActiveRecord::Base
  attr_accessible :body, :title, :wiki
  belongs_to :wiki 
  #belongs_to :user

  validates :body, presence: true
  validates :title, presence: true 

  validates :title, length: { maximum: 40 } 


  extend FriendlyId
  friendly_id :title, use: :history


#before_filter :find_article  

#  def find_article
#    @article = Article.find(params[:id])
#    if request.path != wiki_articles_path(@wiki)
#      return redirect_to [@wiki, @article], :status => :moved_permanently
#    end
#  end

  end

