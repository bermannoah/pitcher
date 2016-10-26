require 'rails_helper'

RSpec.describe Pitch, type: :model do
  context "invalid attributes" do
    it "is invalid without a title" do
      pitch = Pitch.new(content: "uehf", user_id: 1)
      expect(pitch).to be_invalid
    end
    
    it "is invalid without content" do
      pitch = Pitch.new(title: "uehf", user_id: 1)
      expect(pitch).to be_invalid
    end
    
    it "is invalid without a user id" do
      pitch = Pitch.new(title: "uehf", content: "1")
      expect(pitch).to be_invalid
    end
  end
  
  context "valid attributes" do
    it "is valid with all relevant information" do
      user = User.create(name: "hello", email: "a@a.com", password: "hunter2")
      pitch = Pitch.new(title: "world", content: "hello", user_id: 1)
      expect(pitch).to be_valid
    end
  end
  
  describe "relationships" do
    it "belongs to a user" do
      pitch = Pitch.new(title: "world", content: "hello", user_id: 1)
      expect(pitch).to respond_to(:user)
    end
  end
end