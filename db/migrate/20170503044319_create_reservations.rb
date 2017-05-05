class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.string :date_start
      t.string :date_end

      t.timestamps
    end
  end
end
