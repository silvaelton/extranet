require_dependency 'support/sefaz/request_situation'

module Sefaz
  class RequestSituation < Support::Sefaz::RequestSituation
    validates :name, presence: true, uniqueness: true

    def presenter
      presenter = call_presenter('Sefaz::BasePresenter', self)
      block_given? ? yield(presenter) : presenter
    end
  end
end
