class SubscriptionMailer < ApplicationMailer
	def send_email(email)    
  		mail(to: email, subject: "Auto Confirmation")
	end
end
