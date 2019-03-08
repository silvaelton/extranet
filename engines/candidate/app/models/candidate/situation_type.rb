require_dependency "support/candidate/situation_type"

module Candidate
  class SituationType < Support::Candidate::SituationType

    validates :name, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }
    
  end
end