require_dependency "support/candidate/dependent"

module Candidate
  class Dependent < Support::Candidate::Dependent

    belongs_to :gender, class_name: 'Support::Common::Gender'
    belongs_to :kinship, class_name: 'Support::Common::Kinship'
    belongs_to :civil_state, class_name: 'Support::Common::CivilState'
    belongs_to :rg_uf, class_name: 'Support::Common::State'
    belongs_to :special_condition_type, class_name: 'Support::Common::SpecialConditionType'

    validates :name, :cpf, :kinship_id, :civil_state_id, :gender_id, presence: true

  end
end