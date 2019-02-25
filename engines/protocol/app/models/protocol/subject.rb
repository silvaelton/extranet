require_dependency 'support/protocol/subject'

module Protocol
  class Subject < Support::Protocol::Subject
    has_many :assessment
  end
end
