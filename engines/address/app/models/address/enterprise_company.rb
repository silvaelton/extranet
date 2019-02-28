require_dependency 'support/address/enterprise_company'

module Address
  class EnterpriseCompany < Support::Address::EnterpriseCompany
    validates :name, uniqueness: true, presence: true
  end
end
