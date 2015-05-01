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

  def destroy
    question = Question.find(params[:question_id])
    answer = question.answers.find(params[:id])
    answer.destroy
    redirect_to question_path(question)
  end

  private

  def answer_params
    params.require(:answer).permit(:content).merge(user: current_user)
  end

end
