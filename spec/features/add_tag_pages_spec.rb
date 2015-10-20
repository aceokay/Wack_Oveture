require 'rails_helper'

describe "Tag creation path" do
  user = FactoryGirl.create(:user)
  tag = FactoryGirl.create(:tag)
  question = FactoryGirl.create(:question)
  it "adds a tag and tags a new question" do
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
    click_on "Add Tag"
    fill_in 'Category', :with => tag.category
    click_on 'Submit'
    click_on "Ask Question"
    fill_in 'Title', :with => question.title
    fill_in 'Body', :with => question.body
    expect(page).to have_content tag.category
  end

  it "rerenders the new tag form if left incomplete" do
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
    click_on "Add Tag"
    fill_in 'Category', :with => ""
    click_on 'Submit'
    expect(page).to have_content "New Tag"
  end
end
