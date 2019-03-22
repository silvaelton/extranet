require_dependency "support/candidate/indication_allotment"

module Candidate
  class IndicationAllotment < Support::Candidate::IndicationAllotment

    belongs_to :enterprise, class_name: 'Address::Enterprise'
    belongs_to :evaluation_entity, required: false, class_name: 'Entity::Cadastre', foreign_key: :evaluation_entity_id
    belongs_to :filter_city, class_name: 'Support::Common::City'
    belongs_to :program, class_name: 'Candidate::Program'

    # validates :name, :enterprise_id, :program_id, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }

  end
end