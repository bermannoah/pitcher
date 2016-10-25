require 'rails_helper'

RSpec.describe "User signs up" do
  scenario "a user sees the sign up button" do    
    visit("/")

    expect(page).to have_content("Signup")
    
    click_link "Signup"

    expect(page).to have_content("Name:")
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")
  end  
end