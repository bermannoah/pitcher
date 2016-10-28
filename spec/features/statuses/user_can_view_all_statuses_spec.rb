require 'rails_helper'

RSpec.describe "User can view all statuses" do
  scenario "a user can see the view all statuses button" do
    user = Fabricate(:user)
    status = Fabricate(:status, title: "New")
    status_2 = Fabricate(:status, title: "Old")
    
    visit root_path
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"
    
    expect(page).to have_content("View All Statuses")
  end
  
  scenario "a user can see all statuses" do
    user = Fabricate(:user)
    status = Fabricate(:status, title: "New")
    status_2 = Fabricate(:status, title: "Old")
    
    visit root_path
    click_link "Login"
    
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"

    click_button "Submit"
    
    click_link "#{user.name}"
    
    click_link "View All Statuses"
    
    expect(page).to have_content("New")
    expect(page).to have_content("Old")

  end
end