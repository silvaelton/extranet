require_dependency "support/candidate/convocation"

module Candidate
  class Convocation < Support::Candidate::Convocation

    belongs_to :program, class_name: 'Candidate::Program'
    belongs_to :sub_program, class_name: 'Candidate::Program'

    validates :name, :start_date, :end_date, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,     ->(status) { where(status: status) }

  end
end