require_dependency 'support/person/staff'

module Pivotal
  class User < Support::Person::Staff

    def presenter
      call_presenter('Pivotal::UserPresenter', self)
    end
  end
end