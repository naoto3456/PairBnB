class CreateListingTags < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_tags do |t|
      t.integer :listing_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
