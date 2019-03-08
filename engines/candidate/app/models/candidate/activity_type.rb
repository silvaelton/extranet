require_dependency "support/candidate/activity_type"

module Candidate
  class ActivityType < Support::Candidate::ActivityType

    validates :name, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }

  end
end