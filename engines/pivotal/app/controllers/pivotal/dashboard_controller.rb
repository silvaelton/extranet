require_dependency 'pivotal/application_controller'

module Pivotal
  class DashboardController < ApplicationController
    
    def index
      @weather = HG::Weather.get(woeid: '455819')
    end

  end
end