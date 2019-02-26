require_dependency 'support/protocol/attach_document'

module Protocol
  class AttachDocument < Support::Protocol::AttachDocument
    belongs_to :document_father, class_name: "Protocol::Assessment"
    belongs_to :document_child, class_name: "Protocol::Assessment"
    belongs_to :sector, class_name: "Support::Person::Sector"
    belongs_to :staff, class_name: "Support::Person::Staff"
  end
end
