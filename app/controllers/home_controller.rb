class HomeController < ApplicationController
  def index
    if logged_in?
      @tweets = current_user.my_feed
    else
      redirect_to :root
    end
  end
end
