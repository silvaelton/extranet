require_dependency 'support/address/enterprise_company'

module Address
  class EnterpriseCompany < Support::Address::EnterpriseCompany
    validates :name, uniqueness: true, presence: true

    has_many :enterprise_company_users, dependent: :destroy
  end
end
