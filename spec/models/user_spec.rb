require 'rails_helper'

describe User do
  it { should have_many(:questions) }
  it { should have_many(:answers) }
  it { should have_many(:comments) }
  it { should validate_confirmation_of :password }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  # it { should use_before_action :encrypt_password }
end
