class ReservationsController < ApplicationController
	
	def new
		@reservation = Reservation.new
		@listing_id = params[:listing_id]
	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		@reservation.listing_id = params[:listing_id]

		if @reservation.save
			#byebug
			result = ReservationJob.perform_later
			flash[:warning] = "Your provisional reservation has been confirmed !!"
			redirect_to new_reservation_braintree_path(@reservation)
		else

		end

	end

	def index
		@reservations = Reservation.where(user_id: current_user.id)
	end

	def show
		@reservation = Reservation.find_by_id(params[:id])
		@listing = @reservation.listing
	end

	private

	def reservation_params
		params.require(:reservation).permit(:date_start, :date_end)
	end


end
