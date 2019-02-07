require_dependency 'cpl/application_controller'

module Cpl
  class NoticesController < ApplicationController # :nodoc:
    before_action :set_notices
    before_action :set_notice, only: %i[edit update destroy show]

    def index; end

    def new
      @notice = Cpl::Notice.new
    end

    def create
      @notice = Cpl::Notice.new(set_params)
      @notice.staff_id = current_user.id
      @notice.save
    end

    def edit; end

    def update
      @notice.update(set_params)
    end

    def destroy
      @notice.destroy
    end

    def show; end

    private

    def set_params
      params.require(:notice).permit(:name, :notice_type_id, :document_number,
                                     :date_proposal, :hour_proposal, :date_open,
                                     :hour_open, :date_session, :hour_session,
                                     :attachement, :observation, :status)
    end

    def set_notices
      @notices = Cpl::Notice.all
    end

    def set_notice
      @notice = Cpl::Notice.find(params[:id])
    end
  end
end
