class ResponsesController < ApplicationController

   def destroy
    response = Response.find(params[:id])
    response.destroy
    redirect_to question_path(response.responsible_id)
  end

end
