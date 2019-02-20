require_dependency 'support/sefaz/request_type'

module Sefaz
  class RequestType < Support::Sefaz::RequestType
    validates :name, presence: true, uniqueness: true

    def presenter
      presenter = call_presenter('Sefaz::BasePresenter', self)
      block_given? ? yield(presenter) : presenter
    end
  end
end
