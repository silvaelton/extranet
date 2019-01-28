require_dependency 'support/person/staff'

module Pivotal
  class User < Support::Person::Staff

    has_many :session_logs, -> { where(target_model: 'Pivotal::User') }, class_name: 'Pivotal::LogSession', foreign_key: :target_id

    def presenter
      call_presenter('Pivotal::UserPresenter', self)
    end
  end
end