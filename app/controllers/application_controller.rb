class ApplicationController < ActionController::Base
  helper_method :authorize_company, :authorize_user, :current_user, :current_company, :is_followed_by_user
  

  def current_user
    @current_user ||= User.find (session[:user_id]) if session[:user_id].present?
  end

  def current_company
    @current_company ||= Company.find(session[:company_id]) if session[:company_id].present?
  end

  

  def authorize_company(company)
    unless company == current_company
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
    true
  end

  def authorize_user(user)
    unless user==current_user
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
    true
  end

  def is_followed_by_user(company_id)
    
    if Company.find(company_id)
      company= Company.find(company_id)
      followers= company.followers
      return true if followers.find{|follower| follower.id==current_user.id } !=nil
      return false
    else
      return false
    end
  end


end
