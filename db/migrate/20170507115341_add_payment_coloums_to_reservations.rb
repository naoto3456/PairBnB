class AddPaymentColoumsToReservations < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :paid, :boolean
  	add_column :reservations, :paid_at , :date
  end
end
