require_dependency 'support/pivotal/user_permission'

module Pivotal
  class UserPermission < Support::Pivotal::UserPermission
    belongs_to :user, class_name: 'Pivotal::User'
    
  end
end