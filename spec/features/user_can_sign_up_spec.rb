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
  
  # scenario "a user creates a new user" do
  #   user = Fabricate(:user)
  #   
  #   visit("/")
  # 
  #   expect(page).to have_content("Signup")
  # 
  #   click_link "Signup"
  #   
  #   fill_in "user[name]", with: user.name
  #   fill_in "user[email]", with: user.email
  #   fill_in "user[password]", with: user.password
  #   fill_in "user[password_confirmation]", with: user.password
  # 
  #   click_button "Submit"
  #   visit("/")
  #   expect(page).to have_content("Signed in as")
  # end
  
end