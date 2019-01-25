require_dependency 'pivotal/application_controller'

module Pivotal
  class UsersController < ApplicationController

    def show
      @user = Pivotal::User.find(params[:id])
    end

    def edit
    end 

    def update
    end

    private

    def set_user
    end

  end
end