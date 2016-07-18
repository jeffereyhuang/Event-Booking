class Timeslot < ActiveRecord::Base
  has_many :openings
  has_many :venues, through: :openings
end
