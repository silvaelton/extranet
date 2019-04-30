require_dependency 'support/pivotal/permission_group_user'

module Pivotal
  class PermissionGroupUser < Support::Pivotal::PermissionGroupUser
    has_many :groups

  end
end