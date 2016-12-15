class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
  validates_presence_of :body

  def vote_value
    self.votes.map {|vote| vote.points }.reduce(:+)
  end

end
