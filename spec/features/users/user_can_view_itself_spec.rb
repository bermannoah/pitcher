require 'rails_helper'

RSpec.describe "User views themself" do
  scenario "a user is logged in" do    
    user = Fabricate(:user)
    
    visit root_path
    
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    expect(page).to have_content("Signed in as #{user.name}")
  end
  
  scenario "a user can view their own profile" do    
    user = Fabricate(:user)
    
    visit root_path
    
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"
    
    expect(page).to have_content("Pitches:")
    expect(page).to have_content("Name: #{user.name}")

  end
end