class User < ActiveRecord::Base
  include BCrypt

  has_many :votes
  has_many :questions
  has_many :answers
  has_many :comments
  validates_presence_of :username, :email
  validates_uniqueness_of :email

  has_secure_password
  validates :password, length: { minimum: 6, maximum: 20 }, on: :create


end
