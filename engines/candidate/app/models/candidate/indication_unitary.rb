require_dependency "support/candidate/cadastre_indication"

module Candidate
  class IndicationUnitary < Support::Candidate::CadastreIndication
    belongs_to :enterprise, class_name: 'Address::Enterprise', required: false
    belongs_to :user, class_name: 'Pivotal::User', required: false
    
    validates :enterprise_id, :justify, presence: true

    validate :count_unit

    private

    def count_unit
      @unit = Address::Enterprise.where(id: self.enterprise_id)

      @unit_quantity = @unit.sum(:unit_quantity)

      @active_indiation = Support::Candidate::CadastreIndication.where(enterprise_id: self.enterprise_id, status: true).count

      @validation = @unit_quantity - @active_indiation

      if @validation <= 0
        errors.add(:enterprise_id, "não possui unidades disponíveis no momento. Indicados até o momento: #{@active_indiation}, total de unidades: #{@unit_quantity} ")
      end

    end
  end
end