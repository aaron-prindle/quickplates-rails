class Suggestion < ActiveRecord::Base
  belongs_to :group
  attr_accessible :lat, :lng, :name, :votes_against, :votes_for, :wait
  #:group_id
end
