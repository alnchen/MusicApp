class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.ensure_session_token
      redirect_to new_session_url
    else
      #ask about flash.now
      render :new
    end
  end

  def show
    # @user = User.find_by(email: email)
    render :show
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
