require_dependency 'support/address/enterprise_typology'
require 'bd_money/rails'

module Address
  class EnterpriseTypology < Support::Address::EnterpriseTypology
    belongs_to :enterprise, required: false

    validates :name, :unit_quantity, presence: true

    money :value_start, precision: 2
    money :value_end, precision: 2
    money :value_general, precision: 2

    def value_start=(value)
      self[:value_start] = 0 unless value.present?
      self[:value_start] = value.gsub('.','').gsub(',','.')
    end

    def value_end=(value)
      self[:value_end] = 0 unless value.present?
      self[:value_end] = value.gsub('.','').gsub(',','.')
    end

    def value_general=(value)
      self[:value_general] = 0 unless value.present?
      self[:value_general] = value.gsub('.','').gsub(',','.')
    end
  end
end
