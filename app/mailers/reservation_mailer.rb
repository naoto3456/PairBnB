class ReservationMailer < ApplicationMailer
	
	def booking_email
		mail to: "pairbnbdev@gmail.com", subject: "ActionMailer test"
	end
end
