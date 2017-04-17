class Flight < ApplicationRecord
  has_many :itinerary_details
  has_and_belongs_to_many :flight_details
end
