class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  validates_presence_of :body

  def vote_value
    self.votes.map {|vote| vote.points }.reduce(:+)
  end
  
end
