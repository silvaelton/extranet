require_dependency 'support/helpdesk/ticket_activity'

module Helpdesk
  class TicketActivity < Support::Helpdesk::TicketActivity
    belongs_to :user, class_name: '::Pivotal::User', foreign_key: :user_id

    mount_uploader :document, Helpdesk::AttachmentUploader

    validates :content, presence: true

  end
end