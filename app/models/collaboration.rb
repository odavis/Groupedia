class Collaboration < ActiveRecord::Base
  attr_accessible :role, :email, :wiki, :user, :wiki_id
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  belongs_to :wiki 
  belongs_to :user 

end
