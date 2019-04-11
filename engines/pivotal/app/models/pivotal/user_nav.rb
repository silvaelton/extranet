require_dependency 'support/pivotal/user_nav'

module Pivotal
  class UserNav < Support::Pivotal::UserNav
    belongs_to :user, class_name: 'Pivotal::User'

  end
end