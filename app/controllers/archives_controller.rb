require 'date'

class ArchivesController < ApplicationController
  def index
    @archives = Archive.paginate(:page => params[:page], :per_page => 10)
    if params[:search]
      @archives = Archive.search(params[:search], params[:sortMethod],
        params[:showImages], params[:showAudio], params[:showVideo])
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
      :featured => params["featured"]
    })

    # Prevent erroring if year is too large
    if @archive.date.year > 9999
        flash[:danger] = "Year must be between 0 and 9999, inclusive"
        redirect_to new_archive_path
        return
    end

    # The tag list has to be saved in a different manner
    begin
      @archive.tag_list.add(params[:archive]["tag_list"], parse: true)
    rescue
      puts "Invalid tag list!"
      redirect_to new_archive_path
    end
    
    # Save the archive in the database
    if @archive.save
      flash[:success] = "Upload successful!"
    else
      flash[:danger] = @archive.errors.full_messages
      return
    end

    # Finally, if this archive is featured, put it on the timeline spreadsheet
    if @archive.featured
      ws = getTimeline
      # Add a new row for the new featured archive
      ws.max_rows += 1
      # Write the new line
      row = ws.max_rows
      ws[row, 1] = @archive.date.year # year
      ws[row, 2] = @archive.date.month # month
      ws[row, 3] = @archive.date.day # day
      ws[row, 10] = @archive.title # headline
      ws[row, 11] = @archive.description # text
      ws[row, 12] = "http://localhost:3000" + @archive.media.url # media link
      ws[row, 19] = @archive.id # id
      ws.save
    end
    redirect_to archives_path
  end

  def destroy
    @archive = Archive.find(params[:id])
    # If this archive was featured, we have to remove it from the timeline
    if @archive.featured
      ws = getTimeline
      for row in 1..ws.max_rows
        # Check the ID column of the spreadsheet to see if we have the right row
        if ws[row, 19] == @archive.id.to_s
          ws.delete_rows(row, 1)
          ws.save
          break
        end
      end
    end
    @archive.destroy
    flash[:success] = "Archive deleted"
    redirect_to archives_path
  end

  private
    # Return a "list" of the form values given for each required parameter
    def permit_archive
      params.require(:archive).permit(
        :media, :title, :description, :date, :tag_list, :featured)
    end

    def getTimeline
      session = GoogleDrive::Session.from_config("config.json")
      return session.spreadsheet_by_key(
        "1BUERgBpEUUJHG4_rgqWVlJaJPjjVUPXCcEEr_K-hltk").worksheets[0]
    end
end
