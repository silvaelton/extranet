require_dependency 'support/attendance/ticket_document'

module Attendance
  class TicketDocument < Support::Attendance::TicketDocument
    mount_uploader :attachment, Support::Attendance::TicketUploader
  end
end