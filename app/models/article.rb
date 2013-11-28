class Article < ActiveRecord::Base
  attr_accessible :body, :references, :title, :wiki
  belongs_to :wiki 

  validates :body, presence: true
  validates :title, presence: true  
end
