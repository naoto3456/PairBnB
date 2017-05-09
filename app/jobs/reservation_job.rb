class ReservationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ReservationMailer.booking_email.deliver_now
  end
end
