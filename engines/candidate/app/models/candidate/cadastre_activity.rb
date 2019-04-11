require_dependency "support/candidate/cadastre_activity"

module Candidate
  class CadastreActivity < Support::Candidate::CadastreActivity

    belongs_to :activity_type, class_name: 'Candidate::ActivityType'
    belongs_to :user, class_name: 'Pivotal::User'

    has_many :activity_documents

    accepts_nested_attributes_for :activity_documents, allow_destroy: true

    validates :title, :activity_type_id, presence: true
  end
end