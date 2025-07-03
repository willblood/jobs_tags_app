class FollowsController < ApplicationController
  before_action :check_user_authorization

  def create
    @follow = @user.follows.build(create_params)
    if @follow.save
      flash[:success]="Follow Success !"
      redirect_to jobs_path 
    else
      flash[:error]= "Failed To follow"
      redirect_to jobs_path
    end
  end

  def unfollow
    raise"eeee"
    @follow = Follow.find_by(user_id: params[:user_id], company_id: params[:company_id])
    if @follow.destroy
      flash[:success]="Destroy success"
      redirect_to jobs_path
    else
      flash[:error]="Failed to destroy"
      redirect_to jobs_path
    end
  end

  
  private 
  def create_params
    params.permit(:company_id, :user_id)
  end

  def set_user
    @user= User.find(params[:user_id])
  end

  def check_user_authorization
    authorize_user(set_user)
  end
end