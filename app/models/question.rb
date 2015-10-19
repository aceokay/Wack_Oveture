class Question < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :users
  has_many :answers
  validates :title, :presence => true
  validates :body, :presence => true
end
