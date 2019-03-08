require_dependency "support/candidate/cadin"

module Candidate
  class Cadin < Support::Candidate::Cadin

    belongs_to :rg_uf, class_name: 'Support::Common::State'
    belongs_to :city, class_name: 'Support::Common::City'

    validates :name, :cpf, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_cpf,        ->(cpf) { where(cpf: cpf) }

  end
end