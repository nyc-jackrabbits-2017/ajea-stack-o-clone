class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable
  validates_presence_of :title, :body

  def vote_value
    self.votes.map {|vote| vote.points }.reduce(:+)
  end
  
end
