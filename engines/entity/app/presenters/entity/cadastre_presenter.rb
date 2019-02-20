require_dependency 'support/application_presenter'

module Entity
  class CadastrePresenter < Support::ApplicationPresenter 

    def acron
      self[:acron].mb_chars.upcase
    end

  end
end