require_dependency 'support/person/job'

module Person
  class Job < Support::Person::Job

    scope :by_name,   ->(name) { where("name ilike '%#{name}%'") }
    scope :by_code,   ->(code) { where("function_code ilike '%#{code}%'") }
    scope :by_status, ->(status) { where(status: status) }

  end
end