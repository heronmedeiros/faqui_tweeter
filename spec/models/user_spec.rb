require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:tweets) }

  context "validations" do

    it { should validate_length_of(:name).is_at_most(40) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_uniqueness_of(:email).on(:create) }
    it { should validate_uniqueness_of(:name) }
    it { should have_secure_password }

    context "when fields are empty" do
      let (:user) { User.new }

      it  "should not be valid" do
        expect(user.valid?).to be_falsy
      end

      it "should not save" do
        expect(user.save).to be_falsy
      end
    end

    context "when fiels are not empty" do
      let (:user) { User.new(
                      name:                  "John Lee",
                      email:                 "johnlee@email.com",
                      password:              "pa$$$$ap",
                      password_confirmation: "pa$$$$ap")
                  }

      it "should save" do
        expect(user.save).to be_truthy
      end

      it "expect to name is not to long" do
        user.name = "lee" * 69
        expect(user.valid?).to be_falsy
        expect(user.errors[:name]).to eq(["is too long (maximum is 40 characters)"])
      end

    end
  end
end
