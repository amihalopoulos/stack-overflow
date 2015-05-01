class AnswersController < ApplicationController
  def new
    if current_user
      @question = Question.find(params[:question_id])
      @answer = @question.answers.new
    else
      flash[:error] = "You must be signed in"
      redirect_to signin_path
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content).merge(user: current_user)
  end
end
