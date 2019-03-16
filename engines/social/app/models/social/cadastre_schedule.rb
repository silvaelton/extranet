require_dependency 'support/social/cadastre_schedule'

module Social
  class CadastreSchedule < Support::Social::CadastreSchedule
    validates :date, :hour, presence: true
  end
end
