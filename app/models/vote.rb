class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true
  validates :points, uniqueness: { scope: :user,
    message: "You can only vote once!" }

end

#
# comment.votes.points = 23
#
# points = [1, -1, 1, 1, -1, 1].reduce(:+)
#
# comment.points
#
# self.votes.reduce {|sum, x| sum + x.points}
