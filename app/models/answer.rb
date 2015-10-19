class Answer < ActiveRecord::Base
  belongs_to :users
  has_many :comments
  validates :body, :presence => true
end
