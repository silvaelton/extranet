require_dependency "support/candidate/indication_activity_type"

module Candidate
  class IndicationActivityType < Support::Candidate::IndicationActivityType

    validates :name, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }
  end
end