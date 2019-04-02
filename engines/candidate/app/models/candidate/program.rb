require_dependency "support/candidate/program"

module Candidate
  class Program < Support::Candidate::Program
    has_many :program_users, dependent: :destroy
  end
end