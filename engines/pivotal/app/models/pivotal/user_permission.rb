require_dependency 'support/pivotal/user_permission'

module Pivotal
  class UserPermission < Support::Pivotal::UserPermission
    has_many :engine_permissions, dependent: :destroy
    
    validates :name, :code,  presnce: true
  end
end