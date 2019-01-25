require_dependency 'application_controller'

module Pivotal
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    
    layout 'application'
  end
end
