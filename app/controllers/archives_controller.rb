class ArchivesController < ApplicationController
  def index
    @archives = Archive.paginate(:page => params[:page], :per_page => 10)
  end

  def new
  	@archive = Archive.new
  end

  def create
    @archive = Archive.new(permit_archive)
    # Get and save the tags seperately since
    # they have to be saved in a special way
    begin
      @archive.tag_list.add(params[:archive]["tags"], parse: true)
    rescue
      puts "Invalid tag list!"
      redirect_to new_archive_path
    end
    return
    if @archive.save
      flash[:success] = "Success!"
      redirect_to archives_path
    else
      puts @archive.errors.full_messages
      redirect_to new_archive_path
    end
  end

  private
    # Return a "list" of the form values given for each required parameter
    def permit_archive
      params.require(:archive).permit(:media, :title, :description, :date)
    end
end
