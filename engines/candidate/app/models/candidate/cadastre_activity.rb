require_dependency "support/candidate/cadastre_activity"

module Candidate
  class CadastreActivity < Support::Candidate::CadastreActivity

    belongs_to :actiity_type, class_name: 'Candidate::ActivityType'
    belongs_to :user, class_name: 'Pivotal::User'

    validates :title, :actiity_type_id, presence: true

  end
end