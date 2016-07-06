class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:status] = 'lender'
      Lender.find(session[:lender_id]) if session[:lender_id]
    else
      Borrower.find(session[:borrower_id]) if session[:borrower_id]
    end
  end
  helper_method :current_user

  def require_login
    redirect_to :root if session[:borrower_id] == nil || session[:lender_id] == nil
  end
end
