class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

  def new
  	@contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
        redirect_to @contact, alert: "User created successfully."
    else
        redirect_to new_contact_path, alert: "Error creating user."
    end
  end

  def show
  	@contacts = Contact.find(params[:id])
  end
end
