class UsersController < ApplicationController
  attr_reader :user
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if user.save
      flash[:success] = t "static_pages.welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]

    return if @user
    redirect_to root_path
    flash[:danger] = t "static_pages.user.invalid_user"
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
