class Suggestion < ActiveRecord::Base
  belongs_to :group
  attr_accessible :lat, :lng, :name, :votes_against, :votes_for, :wait, :reference
  #:group_id
end
