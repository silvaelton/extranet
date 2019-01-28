require_dependency 'pivotal/application_controller'

module Pivotal
  class SessionLogsController < ApplicationController
    
    def index
      @pagy, @logs = pagy(current_user.session_logs.order(created_at: :desc))
    end
    
  end
end