require 'rails_helper'

describe "User signs up" do
  scenario "a user sees the sign up button" do
    user = Fabricate(:user)
    
    visit /
    
    expect(page).to have_content("Sign Up")
  end
  
end