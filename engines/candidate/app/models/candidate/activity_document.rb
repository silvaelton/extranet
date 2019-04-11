require_dependency 'support/candidate/activity_document'

module Candidate
  class ActivityDocument < Support::Candidate::ActivityDocument
    mount_uploader :document, Candidate::DocumentUploader

    validates :document, presence: true
  end
end