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
    end

    def destroy
    end

  end
end