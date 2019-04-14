module Pivotal
  class UserPermissionsController < ApplicationController
    before_action :set_user
    before_action :set_system_engines
        
    def index
    end

    def new
      @user_permission = @user.user_permissions.new
      @user_permission.user_id = params[:user_id]
      @user_permission.permission_id = params[:permission_id]
      @user_permission.creator_id = current_user.id
      @user_permission.save
    end
    
    def destroy
      @user_permission = @user.user_permissions.find_by(permission_id: params[:id])
      @user_permission.destroy
    end

    private

    def set_user
      @user = Pivotal::User.find(params[:user_id])
    end

    def set_params
      params.require(:user_nav).permit(:user_id, :creator_id, :permission_id)
    end

    def set_system_engines
      @system_engines = Pivotal::SystemEngine.all.order(:name)
    end

    def set_user_permission
      @user_permissions = @user.user_permissions.find(params[:id])
    end

  end
end