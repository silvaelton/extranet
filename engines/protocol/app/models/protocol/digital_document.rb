require_dependency 'support/protocol/digital_document'

module Protocol
  class DigitalDocument < Support::Protocol::DigitalDocument
    belongs_to :assessment
    belongs_to :staff, class_name: "Support::Person::Staff"
  end
end
