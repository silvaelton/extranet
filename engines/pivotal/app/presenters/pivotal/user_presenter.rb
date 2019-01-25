require_dependency 'support/application_presenter'

module Pivotal
  class UserPresenter < Support::ApplicationPresenter 

    def format_name 
      self.name.downcase.capitalize
    end

    def short_name
      "#{self.name.split(' ')[0].downcase.humanize}"
    rescue 
      "Error ao carregar nome"
    end
  end
end