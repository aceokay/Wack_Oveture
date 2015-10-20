require 'rails_helper'

describe "User adds question path" do
  user = FactoryGirl.create(:user)
  question = FactoryGirl.create(:question)
  it "deletes a question" do
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
    click_on question.title
    click_on "Delete Question"
    expect(page).not_to have_content question.title
  end
end
