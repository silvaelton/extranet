require_dependency "support/candidate/occurrence_target"

module Candidate
  class OccurrenceTarget < Support::Candidate::OccurrenceTarget

    validates :name, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }

  end
end