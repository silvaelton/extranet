require_dependency 'support/cpl/notice_participant'

module Cpl
  class NoticeParticipant < Support::Cpl::NoticeParticipant
    belongs_to :notice, required: false
    belongs_to :participant, required: false
  end
end
