class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    admin_users_path if resource.is_a?(Admin)
  end

  def after_sign_out_path_for(_)
    new_admin_session_path
  end

  private

  def user_not_authorized
    head :forbidden
  end
end
