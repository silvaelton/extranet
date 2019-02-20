require_dependency 'support/sefaz/allotment'

module Sefaz
  class Allotment < Support::Sefaz::Allotment
    belongs_to :request_situation, required: false
    belongs_to :notifier,          required: false
    belongs_to :request_type,      required: false
    belongs_to :exemption_type,    required: false

    has_many :exemptions
  end
end
