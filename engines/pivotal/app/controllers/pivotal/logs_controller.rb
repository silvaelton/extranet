require_dependency 'pivotal/application_controller'

module Pivotal
  class LogsController < ApplicationController

    def index
      @logs = Pivotal::Log.where(user_id: current_user.id)
    end
    
  end
end