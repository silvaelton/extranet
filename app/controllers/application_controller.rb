require_dependency 'pivotal/nav_helper'
require 'pagy/extras/bootstrap'

class ApplicationController < ActionController::Base
  before_action :set_action_logger!
  before_action :get_params_for_filter

  helper Pivotal::NavHelper
  helper_method :current_user, :authenticate_user!, :filter_params

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

  def get_params_for_filter
    engine_name = controller_path.split('/')[0]

    params.each do |key, value|
      if key.include?('by_')
        
        session[:filter] = {} if !session.has_key?(:filter)
       
        if session[:filter][engine_name].nil?
          session[:filter][engine_name] = {}
        elsif session[:filter][engine_name].count > 12
          session[:filter].delete engine_name
        else
          session[:filter][engine_name][key] = value
        end

      end
    end
  end

  def filter_params
    engine_name = controller_path.split('/')[0]
    session[:filter][engine_name]
  end



end
