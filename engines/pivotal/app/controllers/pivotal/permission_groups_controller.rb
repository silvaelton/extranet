require_dependency 'pivotal/application_controller'

module Pivotal
  class PermissionGroupsController < ApplicationController
    before_action :set_permission_groups
    before_action :set_permission_group, only: [:edit, :update, :destroy]

    def index; end

    def new
      @permission_group = Pivotal::PermissionGroup.new
    end

    def create
      @permission_group = Pivotal::PermissionGroup.new(set_params)
      @permission_group.save
    end

    def edit;end

    def update
      @permission_group.update(set_params)
    end

    def destroy
      @permission_group.destroy
    end

    private

    def set_params
      params.require(:permission_group).permit(:name, :description, :permission_ids, :group_type)
    end

    def set_permission_group
      @permission_group = Pivotal::PermissionGroup.find(params[:id])
    end

    def set_permission_groups
     @pagy, @permission_groups = pagy(Pivotal::PermissionGroup.all.order(:id))
    end
  end
end
