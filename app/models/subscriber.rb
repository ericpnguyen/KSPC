class Subscriber < ApplicationRecord
after_create :send_email_to_subscribers

private 
  def send_email_to_subscribers
  		Subscriber.all.each do |subscriber|
   			SubscriptionMailer.send_email(subscriber.email)
  	    end
  end 
end
