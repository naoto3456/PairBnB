class BraintreeController < ApplicationController

	def new
		@client_token = Braintree::ClientToken.generate
		@reservation = Reservation.find_by_id(params[:reservation_id])
	end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
	  reservation = Reservation.find_by_id(params[:reservation_id])

	  result = Braintree::Transaction.sale(
	   :amount => reservation.listing.price, #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )
	  if result.success?
	  	reservation.paid = true
	  	reservation.paid_at = Date.today
	  	reservation.payment_id = result.transaction.id
	  	if reservation.save
		    redirect_to user_reservations_path(current_user), :flash => { :success => "Your reservation has been confirmed " }
	  	else
		    redirect_to user_reservations_path(current_user), :flash => { :error => "Your reservation has been failed. Please try again." }
	  	end
	  else
	    redirect_to user_reservations_path(current_user), :flash => { :error => "Your reservation has been failed. Please try again." }
	  end 
	end

end
