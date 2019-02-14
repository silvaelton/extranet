require_dependency 'support/juridical/advice_type'

module Juridical
  class AdviceType < Support::Juridical::AdviceType
    validates :name, presence: true
  end
end
