class SubscribersController < ApplicationController
	def create
    	@subscriber = Subscriber.new(params[:subscriber].permit(:email))
    	if @subscriber.save
    		SubscriptionMailer.send_email(@subscriber.email).deliver
        	redirect_to @subscriber, alert: "User created successfully."
   		else
        	redirect_to new_subscriber_path, alert: "Error creating user."
    end

  	end

  	def index
  		@subscribers = Subscriber.all
  	end
end
