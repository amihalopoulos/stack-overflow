class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save!
      redirect_to return_point, notice: "You are now signed in"
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
    @questions = @user.questions
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end