require_dependency "support/address/enterprise_company_user"

module Address
  class EnterpriseCompanyUser < Support::Address::EnterpriseCompanyUser
    validates :name, :email, :password, presence: true

  end
end