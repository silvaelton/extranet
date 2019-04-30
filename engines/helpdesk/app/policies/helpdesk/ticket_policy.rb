module Helpdesk
  class TicketPolicy < ::Support::ApplicationPolicy

    # 1 => aberto
    # 2 => em execução
    # 3 => agendado
    # 4 => cancelado
    # 5 => finalizado
    
    def is_open?
      [1,2,3].include?(self.situation_type_id)
    end

  end
end