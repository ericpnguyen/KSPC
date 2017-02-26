class ArchivesController < ApplicationController
  def index
    @archives = Archive.all
  end

  def new
  	@archive = Archive.new
  end

  def create
    @archive = Archive.new(permit_archive)
    if @archive.save
      flash[:success] = "Success!"
      redirect_to archives_path
    else
      puts @archive.errors.full_messages
      redirect_to new_archive_path
    end
  end

  private
    def permit_archive
      params.require(:archive).permit(:media, :title)
    end
end
