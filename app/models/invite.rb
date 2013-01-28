class Invite < ActiveRecord::Base
  belongs_to :user
  attr_accessible :accept, :group_id, :username
end
