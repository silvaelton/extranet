require_dependency 'pivotal/nav_helper'

class ApplicationController < ActionController::Base
  helper Pivotal::NavHelper

  helper_method :current_user

  private

  def current_user
    1
  end
end
