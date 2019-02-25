require_dependency 'support/protocol/conduct'

module Protocol
  class Conduct < Support::Protocol::Conduct
    belongs_to :assessment
    belongs_to :allotment
    belongs_to :staff,  class_name: "Support::Person::Staff"
    belongs_to :sector, class_name: "Support::Person::Sector"
  end
end
