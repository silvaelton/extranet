module Attendance
  class Ticket < Support::Attendance::Ticket
    belongs_to :cadastre, class_name: "Support::Candidate::Cadastre"
    belongs_to :cadastre_mirror, class_name: "Support::Candidate::CadastreMirror"
    belongs_to :ticket_category, foreign_type: :category_id

    has_many   :ticket_steps

    def presenter
      presenter = call_presenter('Support::Attendance::TicketPresenter', self)
      block_given? ? yield(presenter) : presenter
    end

  end
end