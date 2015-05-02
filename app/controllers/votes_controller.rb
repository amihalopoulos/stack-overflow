class VotesController < ApplicationController
  def create
    if params[:question_id]
      @question = Question.find(params[:question_id])
      @vote = @question.votes.find_or_create_by(user: current_user)
      @vote.update(value: params[:value])
    elsif params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      @question = @answer.question
      @vote = @answer.votes.find_or_create_by(user: current_user)
      @vote.update(value: params[:value])
    end

      redirect_to question_path(@question)
  end
end