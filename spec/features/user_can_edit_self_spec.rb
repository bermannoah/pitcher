require 'rails_helper'

RSpec.describe "User views themself" do
  scenario "a user can see the edit button" do    
    user = Fabricate(:user)
    
    visit("/")
    
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"
    
    expect(page).to have_content("Name: #{user.name}")
    expect(page).to have_content("Edit Account")
  end
  
  scenario "a user can edit their profile" do
    user = Fabricate(:user)
    
    visit("/")
    
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"
    expect(page).to have_content("Email: #{user.email}")

    click_link "Edit Account"

    fill_in "user[email]", with: "personal@email.com"
    
    click_button "Update User"
    click_link "#{user.name}"

    expect(page).to have_content("Name: #{user.name}")
    expect(page).to_not have_content("Email: #{user.email}")
    expect(page).to have_content("Email: personal@email.com")
  end
end