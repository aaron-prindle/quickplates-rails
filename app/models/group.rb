class Group < ActiveRecord::Base
  has_many :users
  has_many :suggestions
  # attr_accessible :title, :body
end
