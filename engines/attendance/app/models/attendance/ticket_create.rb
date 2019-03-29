module Attendance
  class TicketCreate
    
    include ActiveModel::Model 

    attr_accessor :cpf, :ticket_category_id

    validates :cpf, cpf: true,  presence: true
    validates :ticket_category_id, presence: true
    validate  :category_is_valid?
    
    private

    def category_is_valid?

      cadastre = Support::Candidate::Cadastre.find_by(cpf: self.cpf)
      ticket_service = Support::Attendance::TicketService.new(cadastre_id: cadastre.id)
      
      if !ticket_service.category_allowed?(self.ticket_category_id)
        errors.add(:ticket_category_id, ticket_service.errors.join(';'))
      end

    rescue Exception => e 
      errors.add(:cpf, "Não foi possível iniciar o atendimento para este CPF, ERRO: #{e}")
    end
  end
end