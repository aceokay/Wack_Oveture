require 'rails_helper'

describe "User added answer path" do
  user = FactoryGirl.create(:user)
  question = FactoryGirl.create(:question)
  comment = FactoryGirl.create(:comment)
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
    click_on "Comment"
    fill_in 'Comment', :with => comment.body
    click_on "Submit"
    expect(page).to have_content comment.body
  end

  it "renders new comment page again if form not filled in" do
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
    click_on "Comment"
    fill_in 'Comment', :with => ""
    click_on "Submit"
    expect(page).to have_content "New Comment"
  end
end
