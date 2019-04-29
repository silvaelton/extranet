module Helpdesk
  class TicketTransfer
    include ActiveModel::Model

    attr_accessor :ticket_type_id, :ticket_subject_id, :ticket_id, :user_id

    validates :ticket_subject_id, :ticket_type_id, presence: true
    validate  :is_equal?

    def save
      return false if !valid?
      
      ticket = Support::Helpdesk::Ticket.find_by(id: self.ticket_id)
      ticket.update(ticket_type_id: self.ticket_type_id, subject_id: self.ticket_subject_id)

      activity = Support::Helpdesk::TicketActivity.where(ticket_id: self.ticket_id).new
      activity.user_id   = self.user_id
      activity.content   = "Responsabilidade do chamado transferida"
      activity.attendant = true
      activity.save
    end

    def set_values
      ticket = Support::Helpdesk::Ticket.find_by(id: self.ticket_id)

      self.ticket_subject_id = ticket.subject_id
      self.ticket_type_id    = ticket.ticket_type_id
    end

    private

    def is_equal?
      ticket = Support::Helpdesk::Ticket.find_by(id: self.ticket_id)

      if (self.ticket_type_id == ticket.ticket_type_id) && (self.ticket_subject_id == ticket.subject_id)
        errors.add(:ticket_type_id, 'é igual ao tipo atual')
        errors.add(:ticket_subject_id, 'é igual ao assunto atual')
      end

    end
  end
end