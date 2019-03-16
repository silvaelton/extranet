require_dependency 'support/social/document_type'

module Social
  class DocumentType < Support::Social::DocumentType
    validates :name, presence: true, uniqueness: true
  end
end
