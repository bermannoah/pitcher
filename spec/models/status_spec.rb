require 'rails_helper'

RSpec.describe Status, type: :model do
  describe "relationships" do
    it "has many pitches" do
      status = Status.create(title: "In progress")
      expect(status).to respond_to(:pitches)
    end
  end
end

  
