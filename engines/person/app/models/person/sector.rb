require_dependency 'support/person/sector'

module Person
  class Sector < Support::Person::Sector

    belongs_to :responsible, required: false, class_name: 'Person::Staff'
    belongs_to :father, required: false,class_name: 'Person::Sector'

    scope :by_name,   ->(name) { where("name ilike '%#{name}%'") }
    scope :by_code,   ->(code) { where(code: code) }
    scope :by_status, ->(status) { where(status: status) }
  end
end