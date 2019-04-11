require_dependency 'pivotal/application_controller'

module Pivotal
  class UsersController < ApplicationController
    before_action :set_users
    
    def index 
    end
    
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

    def set_users
      @users = Pivotal::User.all.order(:name)
    end

  end
end