class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable
  validates_presence_of :title, :body
end
