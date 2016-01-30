require "rails_helper"

RSpec.describe TweetsController, :type => :controller do
  describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "loads all of the posts into @posts" do
        t1, t2 = Tweet.create!(body: "TOP", user_id: 1), Tweet.create!(body: "BOTTOM", user_id: 1)
        get :index
        expect(assigns(:tweets)).to match_array([t1, t2])
      end
  end
end