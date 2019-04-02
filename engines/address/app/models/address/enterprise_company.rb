require_dependency 'support/address/enterprise_company'

module Address
  class EnterpriseCompany < Support::Address::EnterpriseCompany

    belongs_to :city, class_name: 'Support::Common::City'
    belongs_to :state, class_name: 'Support::Common::State'

    validates :name, uniqueness: true, presence: true

    has_many :enterprise_company_users, dependent: :destroy
  end
end
