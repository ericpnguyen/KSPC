class MainsController < ApplicationController
  def index
  	@subscriber = Subscriber.new
    @blog = Blog.last(3).reverse
  end

  def media
  end

  def admin
  end
end
