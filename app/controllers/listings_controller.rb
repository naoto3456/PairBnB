class ListingsController < ApplicationController

	def index
		@listing = Listing.new
		if params[:listing_search_form].present?
			@listings = Listing.price_more(params[:listing_search_form][:price_from]).price_less(params[:listing_search_form][:price_to])
		else
			@listings = Listing.all
		end
	end

	# def search
	# 	@listing = Listing.new
	# 	#@listings = Listing.price_range(params[:listing_search_form][:price_from],params[:listing_search_form][:price_to])
	# 	@listings = Listing.price_more(params[:listing_search_form][:price_from]).price_less(params[:listing_search_form][:price_to])
	# 	render 'index'
	# end

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
		byebug
		if @listing.update(listing_param)
			redirect_to listings_path, :flash => { :success => "Update succeed!" }
		else
			render 'edit'
		end	
	end

	def show
		@listing = Listing.find(params[:id])	
		@reservation = @listing.reservations.new	
	end

	private

	def listing_param
    	params.require(:listing).permit(:title, :price, :room_type, :description, {tag_ids: []}, {avatars: []})
  	end

end