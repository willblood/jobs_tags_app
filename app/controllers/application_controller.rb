class ApplicationController < ActionController::Base
  helper_method :user_logged_in? , :authorize_company, :authorize_user, :current_user, :current_company, :company_logged_in?
  

  def current_user
    @current_user ||= User.find (session[:user_id]) if session[:user_id].present?
  end

  def current_company
    @current_company ||= Company.find(session[:company_id]) if session[:company_id].present?
  end

  def user_logged_in?
    return true if current_user != nil
    false
  end

  def company_logged_in?
    return true if current_company !=nil
    false
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


end
