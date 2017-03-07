class SessionsController < ApplicationController
  def new
  end
  def create
  user = User.find_by(login: params[:login])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_url
  else
    flash.now.alert = 'Login or password is invalid'
    render :new
  end
end
def destroy
  session[:user_id] = nil
  redirect_to root_url
end
end