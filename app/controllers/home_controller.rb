class HomeController < ApplicationController
  def index
    @posts = Bug.last(3)
  end
end
