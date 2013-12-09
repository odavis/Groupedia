class Subscription < ActiveRecord::Base
  attr_accessible :account, :customerid, :user_id
  belongs_to :user
end
