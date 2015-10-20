require 'rails_helper'

describe "User adds question path" do
  user = FactoryGirl.create(:user)
  question = FactoryGirl.create(:question)
  it "adds a question" do
    visit '/'
    click_on "Sign Up"
    fill_in 'Display Name', :with => user.name
    fill_in 'Email (required, but never shown)', :with => user.email
    fill_in 'Password', :with => user.password
    fill_in 'Confirm Password', :with => user.password
    click_on 'Confirm Sign Up'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on "Log in"
    click_on "Ask Question"
    fill_in 'Title', :with => question.title
    fill_in 'Body', :with => question.body
    click_on "Submit"
    expect(page).to have_content question.title
  end

  it "rerenders question form if left unedited" do
    visit '/'
    click_on "Sign Up"
    fill_in 'Display Name', :with => user.name
    fill_in 'Email (required, but never shown)', :with => user.email
    fill_in 'Password', :with => user.password
    fill_in 'Confirm Password', :with => user.password
    click_on 'Confirm Sign Up'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on "Log in"
    click_on "Ask Question"
    fill_in 'Title', :with => ""
    fill_in 'Body', :with => ""
    click_on "Submit"
    expect(page).to have_content "New Question"
  end
end
