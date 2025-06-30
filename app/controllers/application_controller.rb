class ApplicationController < ActionController::Base

  helper_method :user_logged_in? , :authorize_company, :authorize_user, :current_user, :current_user

  def current_user
    @current_user ||= User.find (session[:user_id])
  end

  def current_company
    @current_company ||= Company.find(session[:company_id])
  end

  def user_logged_in?
    true if current_user=!nil
    false
  end

  def company_logged_in?
    true if current_company=!nil
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
