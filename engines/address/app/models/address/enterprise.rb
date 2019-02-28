require_dependency 'support/address/enterprise'

module Address
  class Enterprise < Support::Address::Enterprise
    has_many :enterprise_typologies

    validates :name, presence: true

    scope :by_name,    ->(name)    { where("name ILIKE ?", "%#{name}%") }
    scope :by_edital,  ->(edital)  { where(number_document: edital) }
    scope :by_process, ->(process) { where(number_assessment: process) }
    scope :by_status,  ->(status)  { where(status: status) }
    scope :by_company, ->(company) { where(company_id: company) }
  end
end
