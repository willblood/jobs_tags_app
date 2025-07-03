class UsersController < ApplicationController
  before_action :set_user , only: [:edit, :update, :show]
  before_action :check_user_authorization, only: [:edit, :update, :show,]
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
    @followed_companies= @user.followed_companies
  end

  def update
    if @user.update(update_params)
      flash[:success]= "Account updated successfully !"
      redirect_to edit_user_path(@user)
    else
      flash.now[:error]= "Account update failed !"
      redirect_to edit_user_path(@user)
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
    params.require(:user).permit(:first_name, :last_name,:email, :avatar)
  end

  def check_user_authorization
    authorize_user(set_user)
  end

  def set_user
    @user= User.find(params[:id])
  end

end
