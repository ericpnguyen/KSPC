class AboutsController < ApplicationController
  before_action :find_about, only: [:edit, :update, :show, :delete]

  # Index action to render all about
  def index
    @abouts = About.all
  end

  # New action for creating edit
  def new
    @about = About.new
  end

  # Create action saves the edit into database
  def create
    @about = About.new(permit_about)
    if @about.save
      flash[:notice] = "Successfully created about!"
      redirect_to abouts_path
    else
      flash[:alert] = "Error creating new about!"
      render :new
    end
  end

  # Edit action retrives about and renders the edit page
  def edit
  end

  # Update action updates the about with the new information
  def update
    if @about.update_attributes(permit_about)
      flash[:notice] = "Successfully updated about!"
      redirect_to abouts_path
    else
      flash[:alert] = "Error updating about!"
      render :edit
    end
  end

  # The destroy action removes the about permanently from the database
  def destroy
    @about = About.find(params[:id])
    if @about.destroy
      flash[:notice] = "Successfully deleted about!"
      redirect_to abouts_path
    else
      flash[:alert] = "Error updating about!"
    end
  end

  private
    def permit_about
      params.require(:about).permit(:content)
    end

    def find_about
      @about = About.find(params[:id])
    end
end
