class UsersController < ApplicationController
  before_action :set_user , only: [:edit, :update, :show]
  before_action :authorize_user, only: [:edit, :update, :show,]
  def new;end

  def create
    @user= User.new(create_params)
    if @user.save
      flash[:success]= "User account created successfully !"
      redirect_to root_path
    else
      flash.now[:error]= "Failed to create account !"
      redirect_to new_user_path
    end
  end

  def edit
    @user
  end

  def update
    if @user.update(update_params)
      flash[:success]= "Account updated successfully !"
      redirect_to user_path
    else
      flash.now[:error]= "Account update failed !"
      redirect_to user_path
    end
  end

  def show
    @followed_companies= @user.followed_companies
  end

  private

  def create_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
  def update_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user= User.find(params[:id])
  end

end
