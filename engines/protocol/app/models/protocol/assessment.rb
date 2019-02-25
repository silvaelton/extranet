require_dependency 'support/protocol/assessment'

module Protocol
  class Assessment < Support::Protocol::Assessment
    belongs_to :document_type, -> {order(:name)}
    belongs_to :subject, -> {order(:name)}
    belongs_to :staff, class_name: "Support::Person::Staff"
    belongs_to :sector, class_name: "Support::Person::Sector"

    belongs_to :candidate, class_name: "Support::Candidate::Cadastre", primary_key: :cpf, foreign_key: :cpf

    has_many :conducts
    has_many :digital_documents
    has_many :locations
    has_many :controls
    has_many :call_controls

    has_many :solicitations

    has_many :attach_documents, foreign_key: "document_father_id"
    has_many :attach_document_children, class_name: "Protocol::AttachDocument", foreign_key: "document_child_id"

    scope :by_process,  -> (process) {where(document_number: process)}
    scope :by_external_number,  -> (external) {where(external_number: external)}
    scope :by_doc_type,  -> (doc_type) {where(document_type_id: doc_type)}
    scope :by_cpf,  -> (cpf) {where(cpf: cpf.gsub('-','').gsub('.',''))}
    scope :by_cnpj,  -> (cnpj) {where(cnpj: cnpj)}
    scope :by_sector,  -> (sector) {where(sector_id: sector)}
    scope :by_subject,  -> (subject) {where(subject_id: subject)}
    scope :by_desc_subject,  -> (desc_subject) {where('description_subject ilike ?', "%#{desc_subject}%")}
    scope :by_interested,  -> (interested) {where("recipient ilike ? ", "%#{interested}%")}
    scope :by_external_agency,  -> (external_agency) {where("external_agency ilike ? ", "%#{external_agency}%")}
    scope :by_observation,  -> (observation) {where("observation ilike ? ", "%#{observation}%")}

    scope :by_date_start, -> (date_start) { where("protocol_assessments.created_at::date >= ?", Date.parse(date_start))}
    scope :by_date_end, -> (date_end) { where("protocol_assessments.created_at::date <= ?", Date.parse(date_end))}
  end
end
