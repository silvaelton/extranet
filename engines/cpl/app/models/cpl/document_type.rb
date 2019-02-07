require_dependency 'support/cpl/document_type'

module Cpl
  class DocumentType < Support::Cpl::DocumentType
    validates :name, presence: true
  end
end
