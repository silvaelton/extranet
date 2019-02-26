require_dependency 'support/protocol/allotment'

module Protocol
  class Allotment < Support::Protocol::Allotment
    belongs_to :staff, class_name: "Support::Pivotal::User"
    has_many :conducts
  end
end
