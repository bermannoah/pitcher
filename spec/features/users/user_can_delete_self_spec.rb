require 'rails_helper'

RSpec.describe "User can delete themself" do
  scenario "a user can see the delete button" do    
    user = Fabricate(:user)
    
    visit root_path
    
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"
    
    expect(page).to have_content("Name: #{user.name}")
    expect(page).to have_content("Delete Account")
  end
  
  scenario "a user can use the delete button" do    
    user = Fabricate(:user)
    
    visit root_path
    
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"

    click_link "Delete Account"
  
    expect(page).to have_content("Welcome!")
    expect(page).to have_content("Signup")
    expect(page).to_not have_content("#{user.name}")
  end
  
  scenario "when deleted a user cannot login" do  
    user = Fabricate(:user)
    
    visit root_path
    
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    click_link "#{user.name}"

    click_link "Delete Account"
    
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    expect(page).to have_content("Login")
    expect(page).to have_content("Email")
    expect(page).to_not have_content("#{user.name}")
  end
  
  scenario "a user can delete itself if it has pitches" do    
    user = Fabricate(:user)
    pitch = Fabricate(:pitch, user: user)
    
    visit root_path
    
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"

    click_link "Delete Account"
  
    expect(page).to have_content("Welcome!")
    expect(page).to have_content("Signup")
    expect(page).to_not have_content("#{user.name}")
  end
end