require_dependency 'cpl/application_controller'

module Cpl
  class NoticeDocumentsController < ApplicationController # :nodoc:
    before_action :set_notice
    before_action :set_notice_documents

    def index; end

    def new
      @notice_document = @notice.notice_documents.new
    end

    def create
      @notice_document = @notice.notice_documents.new(set_params)
      @notice_document.staff_id = current_user.id
      @notice_document.save
    end

    def destroy
      @notice_document = @notice.notice_documents.find(params[:id])
      @notice_document.destroy
    end

    private

    def set_params
      params.require(:notice_document).permit(:document_type_id)
    end

    def set_notice_documents
      @notice_documents = @notice.notice_documents.all
    end

    def set_notice
      @notice = Cpl::Notice.find(params[:notice_id])
    end
  end
end
