require 'rails_helper'

describe User do
  it { should have_many(:questions) }
  it { should have_many(:answers) }
  it { should have_many(:comments) }
  it { should validate_confirmation_of :password }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  it 'is admin if the first person saved' do
    user = FactoryGirl.create(:user)
    user.save
    expect(user.admin).to eq(true)
  end

  it 'encrypts a given password and builds a password_salt' do
    user = FactoryGirl.create(:user)
    password = user.password
    user.save
    expect(user.password_hash).to_not eq(password)
  end

  it 'authenticates a users given password' do
    user = FactoryGirl.create(:user)
    password = user.password
    email = user.email
    user.save
    expect(User.authenticate(email, password)).to eq(user)
  end
end
