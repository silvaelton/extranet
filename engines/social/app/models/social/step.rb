require_dependency 'support/social/step'

module Social
  class Step < Support::Social::Step
    validates :name, presence: true, uniqueness: true
  end
end
