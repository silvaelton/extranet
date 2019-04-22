require_dependency 'support/address/unit_label'

module Address
  class UnitLabel < Support::Address::UnitLabel

    belongs_to :user, class_name: 'Pivotal::User'
    belongs_to :label, class_name: 'Address::Label'

    validates :label_id, presence: true

  end
end
