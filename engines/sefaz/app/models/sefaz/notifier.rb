require_dependency 'support/sefaz/notifier'

module Sefaz
  class Notifier < Support::Sefaz::Notifier
    validates :name, :cnpj, presence: true, uniqueness: true
    validates :cnpj, cnpj: true
  end
end
