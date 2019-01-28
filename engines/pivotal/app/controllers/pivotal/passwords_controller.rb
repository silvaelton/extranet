require_dependency 'pivotal/application_controller'

module Pivotal
  class PasswordsController < ApplicationController

    def edit
      @password = Pivotal::Password.new
    end
    
    def update
      @password = Pivotal::Password.new(set_params)
      @password.user_id = current_user.id
      @password.update_password!
    end
    
    private
    
    def set_params
      params.require(:password).permit(:password_current, :password_new, :password_confirmation)
    end
    
  end
end