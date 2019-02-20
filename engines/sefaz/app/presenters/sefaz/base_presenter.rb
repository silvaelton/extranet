require_dependency 'support/application_presenter'

module Sefaz
  class BasePresenter < Support::ApplicationPresenter

    def status
      self[:status] = self[:status] == true ? "Ativo" : "Inativo"
    end
  end
end
