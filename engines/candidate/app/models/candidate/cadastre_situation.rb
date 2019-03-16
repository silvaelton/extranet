require_dependency "support/candidate/cadastre_situation"

module Candidate
  class CadastreSituation < Support::Candidate::CadastreSituation

    belongs_to :user, class_name: 'Pivotal::User'

    validates :situation_type_id, :observation, presence: true

  end
end