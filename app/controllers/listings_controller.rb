class ListingsController < ApplicationController

	def index
		@listing = Listing.new
		@listings = Listing.all
	end

	def search
		@listing = Listing.new(listing_param)
		@listings = Listing.where(price: params[:listing][:price])
		#@result = Listing.min_max_price(params[:min], params)
		render 'index'
	end

	def new
		@listing = Listing.new
	end	

	def create
		@listing = Listing.new(listing_param)
		@listing.user_id = current_user.id
		if @listing.save
			#render
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
		if @listing.update(listing_param)
			redirect_to listings_path
		else
			render 'edit'
		end	
	end

	def show
		@listing = Listing.find(params[:id])		
	end

	private

	def listing_param
    	params.require(:listing).permit(:title, :price, :room_type, :description, {tag_ids: []}, {avatars: []})
  	end

end