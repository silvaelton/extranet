require_dependency 'support/helpdesk/ticket_attachment'

module Helpdesk
  class TicketAttachment < Support::Helpdesk::TicketAttachment
    mount_uploader :document, Helpdesk::AttachmentUploader

    validates :document, presence: true
  end
end