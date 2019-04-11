require_dependency "support/candidate/program_user"

module Candidate
  class ProgramUser < Support::Candidate::ProgramUser
    belongs_to :program, class_name: 'Candidate::Program', required: false
    belongs_to :user, class_name: 'Pivotal::User', required: false

    validates :program_id, :user_id, presence: true
  end
end