require_dependency 'application_controller'

module Cpl
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    layout 'application'
    helper ::ApplicationHelper
    include Pagy::Backend
  end
end
