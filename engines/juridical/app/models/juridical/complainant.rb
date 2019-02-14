require_dependency 'support/juridical/complainant'

module Juridical
  class Complainant < Support::Juridical::Complainant
    belongs_to :staff,        required: false, class_name: "Person::Staff"
    belongs_to :legal_advice, required: false

    validates :name, presence: true
  end
end
