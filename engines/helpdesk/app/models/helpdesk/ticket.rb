module Helpdesk
  class Ticket < Support::Helpdesk::Ticket
    belongs_to :ticket_location, required: false, foreign_key: :location_id
    belongs_to :ticket_situation_type, required: false, foreign_key: :situation_type_id
    belongs_to :ticket_type
    belongs_to :ticket_subject, class_name: 'Helpdesk::TicketTypeSubject', foreign_key: :subject_id
    belongs_to :user, class_name: 'Pivotal::User'

    has_many :ticket_attachments
    has_many :ticket_activities

    accepts_nested_attributes_for :ticket_attachments, allow_destroy: true

    validates :ticket_type_id, :subject_id, :contact, :description, presence: true
    validates :schedule_date, presence: true, if: -> { self.schedule }
    
    scope :by_current_user, -> (current_user) {
      where(ticket_type_id: current_user_types(current_user))  
    }

    def self.current_user_types(current_user)
      TicketTypeUser.where(user_id: current_user.id).map(&:ticket_type_id)
    end

    def presenter
      call_presenter('Helpdesk::TicketPresenter', self)
    end

  end
end