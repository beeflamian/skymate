class Itinerary < ApplicationRecord
  has_many :flights
  has_many :itinerary_details
end
