require_dependency 'support/address/activity_type'

module Address
  class ActivityType < Support::Address::ActivityType
    validates :name, uniqueness: true, presence: true
  end
end
