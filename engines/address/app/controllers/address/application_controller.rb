require_dependency 'application_controller'

module Address
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    helper ::ApplicationHelper
    include Pagy::Backend

    layout 'application'
  end
end
