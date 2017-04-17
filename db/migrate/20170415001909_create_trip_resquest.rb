class CreateTripResquest < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_resquests do |t|
      t.boolean :roundtrip, null: false
      t.string :departing_from, null: false
      t.string :destination, null: false
      t.datetime :start_departing_date, null: false
      t.datetime :end_departing_date, null: false
      t.datetime :start_return_date
      t.datetime :end_return_date
      t.integer :adult_number, null: false, default: 1
      t.integer :infant_number, null: false, default: 0
      t.string :priority, null: false
      t.string :statue, null: false
      t.text :note
    end

    create_table :itineraries do |t|
      t.belongs_to :trip_resquests, index: true
      t.date :departing_date
      t.date :return_date
      t.float :price
    end

    create_table :itinerary_details do |t|
      t.belongs_to :itineraries, index: true
      t.integer :first_flight
      t.integer :second_flight
      t.integer :third_flight
      t.integer :fourth_flight
      t.integer :fifth_flight
    end

    create_table :flights do |t|
      t.belongs_to :itineraries, index: true
      t.datetime :departing_time
      t.datetime :arriving_time
      t.string :seat
      t.string :flight_class
      t.boolean :wifi
      t.string :power
      t.float :price
    end

    create_table :flight_details do |t|
      t.string :aircraft
      t.string :company
      t.string :departing_from
      t.string :arriving
      t.string :duration
    end

    create_table :flights_flight_details do |t|
      t.belongs_to :flights, index: true
      t.belongs_to :flight_details, index: true
    end
  end
end
