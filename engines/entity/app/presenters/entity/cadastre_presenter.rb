require_dependency 'support/application_presenter'

module Entity
  class CadastrePresenter < Support::ApplicationPresenter 

    def acron
      self[:acron].mb_chars.upcase
    end

    def cnpj
      self[:cnpj].format_cnpj
    end

    def name
      self[:name].capitalize
    end

  end
end