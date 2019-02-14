require_dependency 'application_controller'

module Brb
  class ApplicationController < ApplicationController

    helper ::ApplicationHelper
    include Pagy::Backend

    layout 'application'
  end
end
