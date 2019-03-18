require_dependency "support/candidate/cadastre"

module Candidate
  class Cadastre < Support::Candidate::Cadastre
    
    has_many :cadastre_situations
    has_many :cadastre_inheritors
    has_many :cadastre_convocations
    has_many :cadastre_activities
    has_many :dependents

  end
end