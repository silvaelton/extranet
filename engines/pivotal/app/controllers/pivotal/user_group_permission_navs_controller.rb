require_dependency 'pivotal/application_controller'

module Pivotal
  class UserGroupPermissionNavsController < ApplicationController
    before_action :set_user
    before_action :set_nav

    def index; end
    
    def new
      @user_group_permission = Pivotal::UserGroupPermissionNav.new
      @user_group_permission.creator_id = current_user.id
      @user_group_permission.user_id = params[:user_id]
      @user_group_permission.group_permission_id = params[:group_permission_id]
      @user_group_permission.save
    end
    
    def destroy
      @user_group_permission = Pivotal::UserGroupPermissionNav.new
      @user_group_permission.group_permission_id = params[:id]
      @user_group_permission.user_id = params[:user_id]
      @user_group_permission.destroy
    end

    private


    def set_user
      @user = Pivotal::User.find(params[:user_id])
    end

    def set_nav
      @navs = Pivotal::Nav.where(father_id: nil).order(:position)
      @permission_groups = Pivotal::PermissionGroup.all
    end



  end
end