class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki
  attr_accessible :email

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


end
