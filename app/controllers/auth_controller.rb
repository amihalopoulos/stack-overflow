class AuthController < ApplicationController

  def signin_form
  end

  def signin
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Bad username or password"
      redirect_to signin_path
    end
  end

  def signout
    session.clear
    redirect_to root_path
  end

end
