require_dependency 'cpl/application_controller'

module Cpl
  class NoticeParticipantsController < ApplicationController # :nodoc:
    def index
      @notice = Cpl::Notice.find(params[:notice_id])
      @notice_participants = @notice.notice_participants.all
    end
  end
end
