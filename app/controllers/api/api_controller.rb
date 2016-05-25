class API::APIController < ApplicationController
  before_action :restrict_access!
  protect_from_forgery with: :null_session

  protected

  attr_reader :current_user
  helper_method :current_user

  def restrict_access!
    unless restrict_access
      render json: { message: 'Invalid API Token' }, status: 401
      return
    end
  end

  def restrict_access
    @current_user ||= User.find_by_api_token(params[:api_token])
  end
end
