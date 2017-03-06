class MainsController < ApplicationController
  def about
  end

  def expo
  end

  def index
  	@contact = Contact.new
  end

  def media
  end
end
