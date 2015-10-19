require 'rails_helper'

describe Question do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should have_and_belong_to_many(:tags) }
  it { should belong_to(:user) }
  it { should have_many(:answers) }
end
