require_dependency 'support/protocol/allotment'

module Protocol
  class Allotment < Support::Protocol::Allotment
    belongs_to :staff, class_name: "Support::Person::Staff"
    has_many :conducts
  end
end
