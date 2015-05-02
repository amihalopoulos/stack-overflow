class VotesController < ApplicationController
  def create
    if params[:question_id]
      @question = Question.find(params[:question_id])
      @vote = @question.votes.find_or_create_by(user: current_user)
    elsif params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      @question = @answer.question
      @vote = @answer.votes.find_or_create_by(user: current_user)
    end

      redirect_to question_path(@question)
  end
end