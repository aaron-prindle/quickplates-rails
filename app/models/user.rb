class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  attr_accessible :last_seen, :password, :phone, :username
  #need to add correct user stuff
end
