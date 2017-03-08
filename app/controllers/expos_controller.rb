class ExposController < ApplicationController
  before_action :find_expo, only: [:edit, :update, :show, :delete]

  # Index action to render all expos
  def index
    @expos = Expo.all
  end

  # New action for creating expo
  def new
    @expo = Expo.new
  end

  # Create action saves the expo into database
  def create
    @expo = Expo.new(permit_expo)
    if @expo.save
      flash[:notice] = "Successfully created expo!"
      redirect_to expos_path
    else
      flash[:alert] = "Error creating new expo!"
      render :new
    end
  end

  # Edit action retrives the expo and renders the edit page
  def edit
  end

  # Update action updates the expo with the new information
  def update
    if @expo.update_attributes(permit_expo)
      flash[:notice] = "Successfully updated expo!"
      redirect_to expos_path
    else
      flash[:alert] = "Error updating expo!"
      render :edit
    end
  end

  # The show action renders the individual expo after retrieving the the id
  def show
  end

  # The destroy action removes the expo permanently from the database
  def destroy
    @expo = Expo.find(params[:id])
    if @expo.destroy
      flash[:notice] = "Successfully deleted expo!"
      redirect_to expos_path
    else
      flash[:alert] = "Error updating expo!"
    end
  end

  private

  def permit_expo
    params.require(:expo).permit(:content)
  end

  def find_expo
    @expo = Expo.find(params[:id])
  end
end
