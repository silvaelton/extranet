require_dependency 'application_controller'

module Candidate
  class ApplicationController < ApplicationController
    layout 'application'

    helper ::ApplicationHelper
    include Pagy::Backend

  end
end
