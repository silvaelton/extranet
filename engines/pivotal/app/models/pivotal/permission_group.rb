require_dependency 'support/pivotal/permission_group'

module Pivotal
  class PermissionGroup < Support::Pivotal::PermissionGroup
    has_many :groups

    enum group_type: ["Menus", "Engines"]
    
  end
end