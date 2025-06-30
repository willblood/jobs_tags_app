class SessionsController < ApplicationController

  def new;end

  def create 
    if User.find_by(email: params[:email]) && User.find_by(email: params[:email]).authenticate(params[:password])
      @user= User.find_by(email: params[:email])  
      session[:user_id]= @user.id
      redirect_to root_path
    elsif Company.find_by(email:params[:email]) && Company.find_by(email: params[:email]).authenticate(params[:password])
      @company= Company.find_by(email:params[:email])
      session[:company_id]= @company.id
      redirect_to root_path
    else
      flash.now[:error]="Invalid Credentials"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id]= nil || session[:company_id]=nil
    redirect_to root_path
  end
end