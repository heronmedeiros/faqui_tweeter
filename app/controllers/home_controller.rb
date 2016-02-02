class HomeController < ApplicationController
  def index
    @tweets = current_user.my_feed
  end
end
