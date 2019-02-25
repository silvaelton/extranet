require_dependency 'support/protocol/document_type'

module Protocol
  class DocumentType < Support::Protocol::DocumentType
    has_many :assessment
  end
end
