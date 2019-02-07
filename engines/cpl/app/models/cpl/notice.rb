require_dependency 'support/cpl/notice'

module Cpl
  class Notice < Support::Cpl::Notice
    belongs_to :notice_type, required: false

    has_many :notice_documents
    has_many :notice_participants

    validates :name, presence: true
  end
end
