require_dependency 'support/sefaz/exemption_type'

module Sefaz
  class ExemptionType < Support::Sefaz::ExemptionType
    validates :name, presence: true, uniqueness: true

    def presenter
      presenter = call_presenter('Sefaz::BasePresenter', self)
      block_given? ? yield(presenter) : presenter
    end
  end
end
