class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :responsible, polymorphic: true
  validates :content, presence: true
end
