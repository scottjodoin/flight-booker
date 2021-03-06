class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :to, foreign_key:  {to_table: :airports}
      t.references :from, foreign_key:  {to_table: :airports}
      t.integer :cost
      t.integer :passenger_capacity
      t.datetime :departure_time
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
