class Restaurant < ActiveRecord::Base
  # acts_as_mappable :default_units => :miles,
  #                  :default_formula => :sphere,
  #                  :distance_field_name => :distance,
  #                  :lat_column_name => :lat,
  #                  :lng_column_name => :lng
  attr_accessible :lat, :lng, :name, :wait
end
