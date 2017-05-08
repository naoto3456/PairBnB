class AddPaymentColumToReservations < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :reservations, :payment_id, :string
  end
end
