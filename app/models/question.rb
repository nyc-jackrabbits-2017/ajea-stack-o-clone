class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments
  has_many :votes, as: :votable
  has_many :answers
  validates_presence_of :title, :body

  def vote_value
    self.votes.map {|vote| vote.points }.reduce(:+)
  end

end
