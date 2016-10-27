require 'rails_helper'

RSpec.describe Status, type: :model do
  describe "Validations" do
    it "is invalid without a title" do
      status = Status.create
      expect(status).to be_invalid
    end
    
    it "is invalid if it is not unique" do
      status = Status.create(title: "Title!")
      status_2 = Status.new(title: "Title!")
      expect(status_2).to be_invalid
    end
    
    it "is valid with a title" do
      status = Status.create(title: "Title!")
      expect(status).to be_valid
    end
  end
  
  describe "relationships" do
    it "has many pitches" do
      status = Status.create(title: "In progress")
      expect(status).to respond_to(:pitches)
    end
  end
end

  
