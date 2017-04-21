class SessionsController < ApplicationController
  def create
    @user = user.find_by_credentials(params[:user][:email], params[:user][:password])
    if user.nil?
     flash[:errors] = ["Invalid credentials."]
     render :new
    else
      session[:session_token] = @user.reset_session_token!
    end
    redirect_to user_url
  end

  def new
    render :new
  end

  def destroy
    @user.reset_session_token
    session[:session_token] = nil
    redirect_to user_url
  end
end
