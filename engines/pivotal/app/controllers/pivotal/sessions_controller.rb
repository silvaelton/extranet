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
        @session.logger!(request, 'signin')
        
        session[:user_id] = @session.user_id
        session[:filter]  = nil

        redirect_to pivotal.root_path
      end
    end
    
    def destroy
      @session = Pivotal::Session.new
      @session.user_id = session[:user_id]
      @session.logger!(request, 'signout')
      
      session[:user_id] = nil
      session[:filter]  = nil
      redirect_to pivotal.new_session_path
    end

    private

    def set_params
      params.require(:session).permit(:username, :password)
    end
  end
end