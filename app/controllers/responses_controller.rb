class ResponsesController < ApplicationController

  def edit
    @response = Response.find(params[:id])
  end

  def update
    @response = Response.find(params[:id])
    if @response.update_attributes(response_params)
      redirect_to question_path(@response.responsible_id)
    else
      render :edit
    end
  end

  def destroy
    response = Response.find(params[:id])
    response.destroy
    redirect_to question_path(response.responsible_id)
  end

  private

  def response_params
    params.require(:response).permit(:content, :user_id)
  end

end
