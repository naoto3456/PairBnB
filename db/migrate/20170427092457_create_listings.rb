class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.integer :room_type
      t.integer :price
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
