require_dependency 'pivotal/application_controller'

module Pivotal
  class SessionsController < ApplicationController 
    layout 'session'

    def index
      redirect_to action: :new
    end

    def new
      @session = Pivotal::Session.new
    end 
    
    def create
      @session = Pivotal::Session.new(set_params)
      if @session.valid?
        session[:user_id] = @session.user_id
        redirect_to pivotal.root_path
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to pivotal.new_session_path
    end

    private

    def set_params
      params.require(:session).permit(:code, :password)
    end
  end
end