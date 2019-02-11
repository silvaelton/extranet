require_dependency 'application_controller'

module Helpdesk
  class ApplicationController < ApplicationController
    before_action :authenticate_user!
    
    helper ::ApplicationHelper
    include Pagy::Backend
  end
end