class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      cookies.permanent[:auth_token] = user.auth_token
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    cookies[:auth_token] = nil
    redirect_to root_url
  end
end
