require_dependency "support/candidate/procedural_type"

module Candidate
  class ProceduralType < Support::Candidate::ProceduralType

    validates :name, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }
    
  end
end