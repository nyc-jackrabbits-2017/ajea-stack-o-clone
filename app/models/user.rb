class User < ActiveRecord::Base
  has_many :votes, :questions, :answers, :comments
  validates_presence_of :username, :email
  validates_uniqueness_of :email
  validates :password, length: { in: 6..20 }
end
