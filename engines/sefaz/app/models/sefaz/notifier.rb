require_dependency 'support/sefaz/notifier'

module Sefaz
  class Notifier < Support::Sefaz::Notifier
    validates :name, :cnpj, presence: true, uniqueness: true
    validates :cnpj, cnpj: true

    def presenter
      presenter = call_presenter('Sefaz::BasePresenter', self)
      block_given? ? yield(presenter) : presenter
    end
  end
end
