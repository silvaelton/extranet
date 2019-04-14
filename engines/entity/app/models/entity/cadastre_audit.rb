require_dependency "support/audit"

module Entity
  class CadastreAudit < Support::Audit

    belongs_to :user, class_name: 'Pivotal::User', foreign_key: :user_id
  
  end
end