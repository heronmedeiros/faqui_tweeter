class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet         = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to home_url, notice: t('tweets.create.correct_save') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: t('tweets.create.update_save') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice:  t('tweets.destroy.correct_destroyed') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
