class Article < ActiveRecord::Base
  attr_accessible :body, :references, :title
  belongs_to :wiki 
end
