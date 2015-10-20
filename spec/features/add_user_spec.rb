require 'rails_helper'

describe "User sign-up and login path" do
  it "adds a user" do
    visit '/'
    click_on "Sign Up"
    fill_in 'Display Name', :with => "Deezl"
    fill_in 'Email (required, but never shown)', :with => "deezl@earthlink.com"
    fill_in 'Password', :with => "lzeed"
    fill_in 'Confirm Password', :with => "lzeed"
    click_on 'Confirm Sign Up'
    click_on "Sign In"
    fill_in 'Email', :with => "deezl@earthlink.com"
    fill_in 'Password', :with => "lzeed"
    click_on "Log in"
    click_on "Profile"
    expect(page).to have_content "Deezl"
  end
end
