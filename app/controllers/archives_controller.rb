class ArchivesController < ApplicationController
  def index
    @archives = Archive.paginate(:page => params[:page], :per_page => 10)
    if params[:search]
      @archives = Archive.search(params[:search])
        .order("created_at DESC")
        .paginate(:page => params[:page], :per_page => 10)
    end
  end

  def new
  	@archive = Archive.new
  end

  def create
    @archive = Archive.new({
      :media => params[:archive]["media"],
      :title => params[:archive]["title"],
      :description => params[:archive]["description"],
      :date => params[:archive]["date"],
    })
    # Get and save the tags seperately since
    # they have to be saved in a special way
    begin
      @archive.tag_list.add(params[:archive]["tag_list"], parse: true)
    rescue
      puts "Invalid tag list!"
      redirect_to new_archive_path
    end

    if @archive.save
      flash[:success] = "Upload complete. Media URL is 
        http://localhost:3000" + @archive.media.url
    else
      flash[:error] = @archive.errors.full_messages
    end
  end

  def destroy
    Archive.find(params[:id]).destroy
    flash[:success] = "Archive deleted"
    redirect_to archives_path
  end

  private
    # Return a "list" of the form values given for each required parameter
    def permit_archive
      params.require(:archive).permit(:media, :title, :description, :date, :tag_list)
    end
end
