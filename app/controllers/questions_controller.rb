class QuestionsController < ApplicationController
before_filter :log_impression, :only=> [:show]

  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @questions = Question.where(user_id: @question.user.id)
  end

  def new
    redirect_to signin_path if !current_user
  end

  def edit
  end

  def create
    question = Question.new(question_params)
    question.user_id ||= session[:user_id]
    # new tags for each tag param sent in.

    if question.save
      redirect_to question_path(question)
    else
      flash[:error] = "Question did not get added"
      redirect_to question_path(question)
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def log_impression
    @question = Question.find(params[:id])

    @question.impressions.find_or_create_by(ip_address: request.remote_ip,user_id: (current_user ? current_user.id : nil))
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :user_id)
  end


end
