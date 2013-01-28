class User < ActiveRecord::Base
  belongs_to :group
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :invites

  validates_uniqueness_of :username

  attr_accessible :last_seen, :password, :phone, :username
  #:group_id
  #need to add correct user stuff
end
