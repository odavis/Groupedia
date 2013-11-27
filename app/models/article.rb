class Article < ActiveRecord::Base
  attr_accessible :body, :references, :title, :wiki
  belongs_to :wiki 
end
