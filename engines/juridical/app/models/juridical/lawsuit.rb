require_dependency 'support/juridical/lawsuit'

module Juridical
  class Lawsuit < Support::Juridical::Lawsuit
    validates :name, presence: true

    default_scope { order('name ASC') }
  end
end
