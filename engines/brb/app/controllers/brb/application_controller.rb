require_dependency 'application_controller'

module Brb
  class ApplicationController < ApplicationController

    layout 'application'
    include Pagy::Backend
  end
end
