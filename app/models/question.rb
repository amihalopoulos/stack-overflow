class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  has_many :tags
  has_many :responses, as: :responsible
  validates :title, :content, presence: true
end
