require_dependency 'application_controller'

module Brb
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    layout 'application'
    include Pagy::Backend
  end
end
