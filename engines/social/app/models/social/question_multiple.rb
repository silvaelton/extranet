require_dependency 'support/social/question_multiple'

module Social
  class QuestionMultiple < Support::Social::QuestionMultiple
    validates :name, presence: true, uniqueness: true    
  end
end
