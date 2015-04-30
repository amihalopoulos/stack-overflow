class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :resposible, polymorphic: true
  validates :content, presence: true
end
