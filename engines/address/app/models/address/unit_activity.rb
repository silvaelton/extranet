require_dependency 'support/address/unit_activity'

module Address
  class UnitActivity < Support::Address::UnitActivity

    belongs_to :user, class_name: 'Pivotal::User'
    belongs_to :actvity_type, class_name: 'Address::ActivityType'

    validates :actvity_type_id, presence: true

    mount_uploader :document, Address::DocumentUploader
  end
end
