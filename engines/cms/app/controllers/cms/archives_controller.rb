require_dependency "cms/application_controller"

module Cms
  class ArchivesController < ApplicationController
    before_action :set_archives
    before_action :set_archive, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status
  
    def index;end

    def show; end

    def new
      @archive = Cms::Archive.new
    end

    def create
      @archive = Cms::Archive.new(set_params)
      @archive.user_id = current_user.id
      @archive.save
    end

    def edit; end

    def update
      @archive.update(set_params)
    end

    def destroy
      @archive.destroy
    end

    private

    def set_params
      params.require(:archive).permit(:name, :archive, :user_id )
    end

    def set_archives
      @pagy, @archives = pagy(apply_scopes(Cms::Archive).all)
    end

    def set_archive
      @archive = Cms::Archive.find(params[:id])
    end

  end
end