class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:errors] = 'Invalid username or password. Please try again.'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
