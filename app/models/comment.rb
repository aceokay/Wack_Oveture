class Comment < ActiveRecord::Base
  belongs_to :users
  belongs_to :questions
  belongs_to :answers
  validates :body, :presence => true
end
