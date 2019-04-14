require_dependency "support/candidate/cadastre_activity"

module Candidate
  class CadastreAudit < Support::Audit

    belongs_to :user, class_name: 'Pivotal::User', foreign_key: :user_id
  
  end
end