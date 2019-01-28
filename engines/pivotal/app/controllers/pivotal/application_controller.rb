require_dependency 'application_controller'
require_dependency 'application_helper'

module Pivotal
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    
    helper ::ApplicationHelper
    include Pagy::Backend
    
    layout 'application'
  end
end
