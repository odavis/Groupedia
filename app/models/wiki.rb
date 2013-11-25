class Wiki < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :topic, :private
  validates :description, presence: true 
  validates :topic, presence: true  
  has_many :articles, dependent: :destroy 

end
