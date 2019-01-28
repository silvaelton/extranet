require_dependency 'pivotal/nav_helper'
require 'pagy/extras/bootstrap'

class ApplicationController < ActionController::Base
  before_action :set_action_logger!

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

  def set_action_logger!
    log = Pivotal::Log.new
    log.user_id               = current_user.id rescue nil
    log.http_method           = request.request_method
    log.controller_class_name = request.filtered_parameters["controller"]
    log.fullpath              = request.fullpath
    log.original_fullpath     = request.original_fullpath
    log.parameters            = request.params
    log.user_agent            = request.user_agent 
    log.remote_ip             = request.remote_ip
    log.save
  end
end
