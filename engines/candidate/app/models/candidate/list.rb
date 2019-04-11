require_dependency "support/candidate/list"

module Candidate
  class List < Support::Candidate::List

    belongs_to :program, class_name: 'Candidate::Program'
    belongs_to :sub_program, class_name: 'Candidate::Program'

    validates :name, :sql, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }

  end
end