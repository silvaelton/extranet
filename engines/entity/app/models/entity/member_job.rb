require_dependency 'support/entity/member_job'

module Entity
  class MemberJob < Support::Entity::MemberJob
    validates :name, presence: true
  end
end