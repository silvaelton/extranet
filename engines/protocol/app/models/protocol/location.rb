require_dependency 'support/protocol/location'

module Protocol
  class Location < Support::Protocol::Location
    belongs_to :assessment
    belongs_to :staff, class_name: "Support::Person::Staff"
  end
end
