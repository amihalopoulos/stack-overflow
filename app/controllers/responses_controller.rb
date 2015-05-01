class ResponsesController < ApplicationController
	def new
    if current_user && params[:question_id]
        @question = Question.find(params[:question_id])
        @response = @question.responses.new
    elsif current_user && params[:answer_id]
        @answer = Answer.find(params[:answer_id])
        @response = @answer.responses.new
    else
      flash[:error] = "You must be signed in"
      redirect_to signin_path
    end
  end

  def create
    if params[:response][:question_id]
      @question = Question.find(params[:response][:question_id])
      @response = @question.responses.new(response_params)
    else
      @answer = Answer.find(params[:response][:answer_id])
      @question = @answer.question
      @response = @answer.responses.new(response_params)
    end

    if @response.save
      redirect_to question_path(@question)
    else
      render :new
    end

  end

  private

  def response_params
    params.require(:response).permit(:content).merge(user: current_user)
  end

end
