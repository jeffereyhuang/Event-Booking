class Venue < ActiveRecord::Base
  has_many :openings
  has_many :timeslots, through: :openings
end
