require_dependency 'support/social/activity_type'

module Social
  class ActivityType < Support::Social::ActivityType
    validates :name, presence: true, uniqueness: true
  end
end
