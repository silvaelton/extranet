require_dependency 'support/cpl/notice_document'

module Cpl
  class NoticeDocument < Support::Cpl::NoticeDocument
    belongs_to :notice, required: false
    belongs_to :document_type, required: false
  end
end
