require_dependency 'support/social/cadastre'

module Social
  class Cadastre < Support::Social::Cadastre
    belongs_to :gender, required: false, class_name: 'Support::Common::Gender'

    has_many :dependents
    has_many :cadastre_schedules
    has_many :cadastre_documents
    has_many :cadastre_activities
    has_many :cadastre_steps
    has_many :answers


    validates :cpf, cpf: true, presence: true
    validates :name, :civil_state_id, :born, presence: true
  end
end
