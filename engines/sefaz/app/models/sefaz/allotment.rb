require_dependency 'support/sefaz/allotment'

module Sefaz
  class Allotment < Support::Sefaz::Allotment
    belongs_to :request_situation, required: false
    belongs_to :notifier,          required: false
    belongs_to :request_type,      required: false
    belongs_to :exemption_type,    required: false

    validates :exemption_type_id,  presence: true
    validates :notifier_id,  presence: true

    has_many :exemptions

    scope :by_protocol,          ->(protocol) { where(protocol_return: protocol) }
    scope :by_date,              ->(date) { where("created_at::date = to_date(?, 'dd/MM/YYYY')", date) }
    scope :by_notifier,          ->(notifier) { where(notifier_id: notifier)}
    scope :by_request_situation, ->(request) { where(request_situation_id: request) }
    scope :by_cpf,               ->(cpf) { joins(:exemptions).where('sefaz_exemptions.cpf = ?', cpf.gsub('-','').gsub('.','')) }
  end
end
