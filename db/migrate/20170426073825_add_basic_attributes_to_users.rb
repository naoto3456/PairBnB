class AddBasicAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :integer, default:0
    add_column :users, :birthday, :date
    add_column :users, :phone_number, :string
    add_column :users, :language, :integer
    add_column :users, :currency, :integer
    add_column :users, :location, :string
    add_column :users, :description, :string
  end
end
