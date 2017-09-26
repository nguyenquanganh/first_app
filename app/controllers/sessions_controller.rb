class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if authenticate? user
      remember_me user
      redirect_to user
    else
      flash.now[:danger] = t "session.danger"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def authenticate? user
    user && user.authenticate(params[:session][:password])
  end

  def remember_me user
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end
end
