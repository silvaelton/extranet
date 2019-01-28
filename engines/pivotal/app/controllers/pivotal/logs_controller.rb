require_dependency 'pivotal/application_controller'

module Pivotal
  class LogsController < ApplicationController

    def index
      @pagy, @logs = pagy(Pivotal::Log.where(user_id: current_user.id).order(created_at: :desc))
    end
    
  end
end