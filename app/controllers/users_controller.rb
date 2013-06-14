class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      cookies.permanent[:auth_token] = @user.auth_token
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes user_params
    redirect_to current_user
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
