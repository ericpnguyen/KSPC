class MainsController < ApplicationController
  def index
  	@subscriber = Subscriber.new
    @blog = Blog.all
  end

  def media
  end

  def admin
  end
end
