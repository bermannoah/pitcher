require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        user = User.new(email: "hello@hello.com", password_digest: "3oujr23ojf")
        expect(user).to be_invalid
      end
      
      it "is invalid without an email" do
        user = User.new(name: "Tim", password_digest: "3oujr23ojf")
        expect(user).to be_invalid
      end
      
      it "is invalid without a password" do
        user = User.new(name: "Cayce", email: "hello")
        expect(user).to be_invalid
      end
      
      it "is invalid without a unique email" do
        user = User.create(name: "Cayce", email: "hello@hello.com", password_digest: "3oujr23ojf")
        user_2 = User.new(name: "Hubertus", email: "hello@hello.com", password_digest: "3ouwefwefejr23ojf")
        expect(user_2).to be_invalid
      end
    end
    
    context "valid attributes" do
      it "is valid with all relevant details" do
        user = User.create(name: "Cayce", email: "hello@hello.com", password_digest: "3oujr23ojf")
        expect(user).to be_valid
      end
      
      it "is valid as long as it has a unique email" do
        user = User.create(name: "Cayce", email: "hello@hello.com", password_digest: "3oujr23ojf")
        user_2 = User.new(name: "Hubertus", email: "blue_ant@hello.com", password_digest: "3ouwefwefejr23ojf")
        expect(user_2).to be_valid
      end
    end
  end
end
