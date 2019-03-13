require_dependency 'support/social/dependent'

module Social
  class Dependent < Support::Social::Dependent
    belongs_to :cadastre,    required: false
    belongs_to :civil_state, required: false, class_name: 'Support::Common::CivilState'
    belongs_to :education,   required: false, class_name: 'Support::Common::Education'
    belongs_to :kinship,     required: false, class_name: 'Support::Common::Kinship'

    validates :name, :born, :kinship_id, presence: true
    validates :cpf, cpf: true, if: ->{ self.cpf.present? }
  end
end
