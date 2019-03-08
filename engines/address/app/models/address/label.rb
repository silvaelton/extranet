require_dependency 'support/address/label'

module Address
  class Label < Support::Address::Label
    validates :name, uniqueness: true, presence: true
  end
end
