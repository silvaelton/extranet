require_dependency 'support/sefaz/exemption_type'

module Sefaz
  class ExemptionType < Support::Sefaz::ExemptionType
    validates :name, presence: true, uniqueness: true
  end
end
