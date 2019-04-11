require_dependency 'support/application_presenter'

module Helpdesk
  class TicketPresenter < Support::ApplicationPresenter 

    def current_situation
      situation_id   = self.situation_type_id
      situation_name = self.ticket_situation_type.name rescue nil
      
      css_class_name = case situation_id
                        when 1 # aberto
                          'success'
                        when 2 # em execução
                          'warning'
                        when 3 # agendado
                          'info'
                        when 4 # cancelado
                          'dark'
                        when 5 # finalizado
                          'dark'
                        else
                          'dark'
                        end


      "<h5><span class='badge badge-#{css_class_name}'>#{situation_name}</span></h5>".html_safe
    end

    def due_class
      # Se chamado esta aberto a mais de 2 dias OU
      # Se a data de hoje é maior que data do agendamento e o chamado não foi finalizado
      if ((self.situation_type_id == 1) && (self.created_at + 2.days <= Date.today)) ||
         ((self.situation_type_id == 3) && (self.schedule_date < Date.today))
        
        "table-danger"
      end
    end
  end
end