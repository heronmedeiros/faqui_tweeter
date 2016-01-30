require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:tweets) }
  
  context "validations" do
    before do
      @user = User.new
    end

    it "expect to name is not to long" do
      @user.name = "lee" * 51
      expect(@user.valid?)
    end

    xit "email addresses should be unique" do
     end
  end

end