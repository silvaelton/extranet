require_dependency 'sefaz/application_controller'

module Sefaz
  class RequestTypesController < ApplicationController # :nodoc:
    before_action :set_request_types
    before_action :set_request_type, only: %i[edit update destroy]

    def index; end

    def new
      @request_type = Sefaz::RequestType.new
    end

    def create
      @request_type = Sefaz::RequestType.new(set_params)
      @request_type.save
    end

    def edit; end

    def update
      @request_type.update(set_params)
    end

    def destroy
      @request_type.destroy
    end

    private

    def set_params
      params.require(:request_type).permit(:name, :status)
    end

    def set_request_types
      @request_types = Sefaz::RequestType.all
    end

    def set_request_type
      @request_type = Sefaz::RequestType.find(params[:id])
    end
  end
end
