class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
  	question = Question.new(question_params)
  	question.user_id ||= session[:user_id]
  	if question.save
  		redirect_to question_path(question)
  	else
  		flash[:error] = "Question did not get added"
  		redirect_to question_path(question)
  	end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end

  private

  def question_params
  	params.require(:question).permit(:title, :content, :user_id)
  end

end
