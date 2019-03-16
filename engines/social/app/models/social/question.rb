require_dependency 'support/social/question'

module Social
  class Question < Support::Social::Question
    validates :name, presence: true, uniqueness: true
  end
end
