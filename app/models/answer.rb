class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :responses, as: :responsible
  validates :question, :user, presence: true
end
