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
    @answer = @question.answers.build(answer_params)
    @answer.update(user: current_user)

    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
