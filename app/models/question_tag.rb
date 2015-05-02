class QuestionTag < ActiveRecord::Base
	belongs_to :question, null: false
	belongs_to :tag, null: false
end