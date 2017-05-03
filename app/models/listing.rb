class Listing < ApplicationRecord
	belongs_to :user
	has_many :listing_tags
	has_many :tags, through: :listing_tags 
    has_many :reservations

	mount_uploaders :avatars, AvatarUploader

	enum room_type:[:entire_house, :private_room, :shared_room]

end
