class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :flight, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :cost
      t.integer :paid

      t.timestamps
    end
  end
end
