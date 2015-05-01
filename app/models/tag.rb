class Tag < ActiveRecord::Base
	belongs_to :question
	validates :question, presence: true
end
