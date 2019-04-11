require_dependency 'support/pivotal/user'

module Pivotal
  class User < Support::Pivotal::User

    has_many :session_logs, -> { where(target_model: 'Pivotal::User') }, class_name: 'Pivotal::LogSession', foreign_key: :target_id
    has_many :user_permisions
    has_many :user_navs

    def presenter
      call_presenter('Pivotal::UserPresenter', self)
    end
  end
end