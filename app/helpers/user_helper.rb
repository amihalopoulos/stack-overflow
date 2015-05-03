module UserHelper

  def rep_calculator(user_id)
    @my_questions = Question.where(user_id: user_id)
    @my_questions.each do |q|
      @rep = 0
      @rep += (q.votes.count * 5)
    end
    @my_answers = Answer.where(user_id: user_id)
    @my_answers.each do |a|
      @rep += (a.votes.count * 10)
    end
    @rep
  end


end
