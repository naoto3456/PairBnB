class BraintreeController < ApplicationController

	def new
		@client_token = Braintree::ClientToken.generate
		@reservation = Reservation.find_by_id(params[:reservation_id])
	end

	def checkout
	  byebug
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
	  #@listing = Reservation

	  result = Braintree::Transaction.sale(
	   :amount => "33.00", #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )
	  if result.success?
	    redirect_to user_reservations_path(current_user), :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to user_reservations_path(current_user), :flash => { :error => "Transaction failed. Please try again." }
	  end 
	end

end
