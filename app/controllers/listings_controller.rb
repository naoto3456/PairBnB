class ListingsController < ApplicationController

	def index
		@listing = Listing.new
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(user_params)
		@listing.user_id = current_user.id
		if @listing.save
			redirect_to listings_path
		else
			render 'new'
		end
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		@listing.title = params[:listing][:title]
		@listing.room_type = params[:listing][:room_type]
		@listing.price = params[:listing][:price]
		@listing.description = params[:listing][:description]
		byebug
		if @listing.save
			redirect_to listings_path
		else
			render 'edit'
		end	
	end

	private

	def user_params
    	params.require(:listing).permit(:title, :price, :room_type, :description)
  	end

end