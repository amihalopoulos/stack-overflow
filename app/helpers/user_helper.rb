module UserHelper

  def rep_calculator(user_id)
    my_questions = Question.where(user_id: user_id)
    rep = 0
    my_questions.each do |q|
      rep += (q.votes.where(value: 1).count * 5)
      rep -= (q.votes.where(value: -1).count * 5)
    end
    my_answers = Answer.where(user_id: user_id)
    my_answers.each do |a|
      rep += (a.votes.where(value: 1).count * 10)
      rep -= (a.votes.where(value: -1).count * 10)
    end
    rep
  end


end
