require_dependency "support/candidate/iptu"

module Candidate
  class Iptu < Support::Candidate::Iptu

    validates :name, :cpf, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_cpf,        ->(cpf) { where(cpf: cpf) }
  end
end