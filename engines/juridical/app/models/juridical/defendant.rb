require_dependency 'support/juridical/defendant'

module Juridical
  class Defendant < Support::Juridical::Defendant
    belongs_to :staff,        required: false, class_name: "Person::Staff"
    belongs_to :legal_advice, required: false
  end
end
