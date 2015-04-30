class User < ActiveRecord::Base
  has_secure_password
  has_many :respones
  has_many :questions
  has_many :answers
  has_many :votes
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  validates :reputation, presence: true
end
