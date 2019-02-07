require_dependency 'application_controller'

module Helpdesk
  class ApplicationController < ApplicationController
       
    helper ::ApplicationHelper
    include Pagy::Backend
  end
end