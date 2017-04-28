class Listing < ApplicationRecord
	belongs_to :user

	enum room_type:[:entire_house, :private_room, :shared_room]

end
