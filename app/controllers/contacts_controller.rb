class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update, :show, :delete]

  # Index action to render all content
  def index
    @contacts = Contact.all
  end

  # New action for creating edit
  def new
    @contact = Contact.new
  end

  # Create action saves the edit into database
  def create
    @contact = Contact.new(permit_contact)
    if @contact.save
      flash[:notice] = "Successfully created content!"
      redirect_to contacts_path
    else
      flash[:alert] = "Error creating new content!"
      render :new
    end
  end

  # Edit action retrives content and renders the edit page
  def edit
  end

  # Update action updates the content with the new information
  def update
    if @contact.update_attributes(permit_contact)
      flash[:notice] = "Successfully updated content!"
      redirect_to contacts_path
    else
      flash[:alert] = "Error updating content!"
      render :edit
    end
  end

  # The destroy action removes the content permanently from the database
  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      flash[:notice] = "Successfully deleted contact!"
      redirect_to contacts_path
    else
      flash[:alert] = "Error updating contact!"
    end
  end

  private
    def permit_contact
      params.require(:contact).permit(:content)
    end

    def find_contact
      @contact = Contact.find(params[:id])
    end
end
