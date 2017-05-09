class Listing < ApplicationRecord
	include PgSearch
	multisearchable :against => [:title, :description]

	belongs_to :user
	has_many :listing_tags
	has_many :tags, through: :listing_tags 
    has_many :reservations

	mount_uploaders :avatars, AvatarUploader
	enum room_type:[:entire_house, :private_room, :shared_room]

	# scope :price_range, ->(price_from, price_to) { where(" #{price_from} < price and price < #{price_to} " ) }

	scope :price_range, ->(price_from, price_to) { where(" ? < price and price < ? ",  price_from, price_to) }

	scope :price_less, ->(price) { where(" price < ?" , price ) }

	scope :price_more, ->(price) { where(" ? < price " , price ) }

end
