require_dependency 'cpl/application_controller'

module Cpl
  class NoticeTypesController < ApplicationController # :nodoc:
    before_action :set_notice_types
    before_action :set_notice_type, only: %i[edit update destroy]

    def index; end

    def new
      @notice_type = Cpl::NoticeType.new
    end

    def create
      @notice_type = Cpl::NoticeType.new(set_params)
      @notice_type.staff_id = current_user.id
      @notice_type.save
    end

    def edit; end

    def update
      @notice_type.update(set_params)
    end

    def destroy
      @notice_type.destroy
    end

    private

    def set_params
      params.require(:notice_type).permit(:name, :status)
    end

    def set_notice_types
      @notice_types = Cpl::NoticeType.all
    end

    def set_notice_type
      @notice_type = Cpl::NoticeType.find(params[:id])
    end
  end
end
