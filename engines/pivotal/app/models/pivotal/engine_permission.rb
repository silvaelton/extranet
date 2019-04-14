require_dependency 'support/pivotal/engine_permission'

module Pivotal
  class EnginePermission < Support::Pivotal::EnginePermission
    validates :name, :code, presence: true
    has_many :user_permissions
  end
end