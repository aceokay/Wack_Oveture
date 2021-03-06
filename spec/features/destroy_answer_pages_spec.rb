require 'rails_helper'

describe "User added answer path" do
  user = FactoryGirl.create(:user)
  question = FactoryGirl.create(:question)
  answer = FactoryGirl.create(:answer)
  it "adds a answer to a comment" do
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
    click_on "Answer"
    fill_in 'Answer', :with => answer.body
    click_on "Submit"
    click_on "Delete Answer"
    expect(page).not_to have_content answer.body
  end
end
