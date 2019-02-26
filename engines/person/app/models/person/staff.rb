require_dependency 'support/person/staff'

module Person
  class Staff < Support::Person::Staff

    belongs_to :born_uf,             class_name: 'Support::Commom::State'
    belongs_to :ctps_uf,             class_name: 'Support::Commom::State'
    belongs_to :electoral_title_uf,  class_name: 'Support::Commom::State'
    belongs_to :gender,              class_name: 'Support::Commom::Gender'
    belongs_to :civil_state,         class_name: 'Support::Commom::CivilState'
    belongs_to :state,               class_name: 'Support::Commom::State'
    belongs_to :city,                class_name: 'Support::Commom::City'
    belongs_to :job,                 class_name: 'Person::Job'
    belongs_to :sector_current,      class_name: 'Person::Sector'
    belongs_to :sector_origin,       class_name: 'Person::Sector'

    scope :by_name,   ->(name) { where("name ilike '%#{name}%'") }
    scope :by_code,   ->(code) { where(code: code) }
    scope :by_sector, ->(sector) { where(sector_current_id: sector) }
  end
end