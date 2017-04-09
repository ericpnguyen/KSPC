class BlogsController < ApplicationController
  before_action :find_blog, only: [:edit, :update, :show, :delete]

  # Index action to render all blogs
  def index
    @blogs = Blog.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    if params[:search]
      @blogs = Blog.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    end
  end

  # New action for creating blog
  def new
    @blog = Blog.new
  end

  def show
  end

  # Create action saves the blog into database
  def create
    @blog = Blog.new({
      :image => params[:blog]["image"],
      :content => params[:blog]["content"],
      :author => params[:blog]["author"],
      :title => params[:blog]["title"]
    })

    # The tag list has to be saved in a different manner
    # begin
    #   @blog.tag_list.add(params[:blog]["tag_list"], parse: true)
    # rescue
    #   puts "Invalid tag list!"
    #   redirect_to new_blog_path
    # end

    if @blog.save
      flash[:notice] = "Successfully created blog!"
      redirect_to blogs_path
    else
      flash[:alert] = "Error creating new blog!"
      render :new
    end
  end

  # Edit action retrives the blog and renders the edit page
  def edit
  end

  # Update action updates the blog with the new information
  def update
    if @blog.update_attributes(permit_blog)
      flash[:notice] = "Successfully updated blog!"
      redirect_to blogs_path
    else
      flash[:alert] = "Error updating blog!"
      render :edit
    end
  end

  # The show action renders the individual blog after retrieving the the id
  def show
  end

  # The destroy action removes the blog permanently from the database
  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:notice] = "Successfully deleted blog!"
      redirect_to blogs_path
    else
      flash[:alert] = "Error updating blog!"
    end
  end

  private

  def permit_blog
    params.require(:blog).permit(:image, :content, :author, :title)
  end

  def find_blog
    @blog = Blog.find(params[:id])
  end
end
