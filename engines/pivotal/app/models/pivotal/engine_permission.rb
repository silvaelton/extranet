require_dependency 'support/pivotal/engine_permission'

module Pivotal
  class EnginePermission < Support::Pivotal::EnginePermission

    
    validates :name, :code, presence: true
  end
end