require_dependency 'pivotal/nav_helper'

class ApplicationController < ActionController::Base
  helper Pivotal::NavHelper

  helper_method :current_user, :authenticate_user!

  private

  def current_user
    Pivotal::User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    if current_user.nil? && (controller_name != 'sessions')
      redirect_to pivotal.new_session_path
    end
  end
end
