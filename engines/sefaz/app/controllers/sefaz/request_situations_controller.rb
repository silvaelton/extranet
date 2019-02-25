require_dependency 'sefaz/application_controller'

module Sefaz
  class RequestSituationsController < ApplicationController # :nodoc:
    before_action :set_request_situations
    before_action :set_request_situation, only: %i[edit update destroy]

    def index; end

    def new
      @request_situation = Sefaz::RequestSituation.new
    end

    def create
      @request_situation = Sefaz::RequestSituation.new(set_params)
      @request_situation.save
    end

    def edit; end

    def update
      @request_situation.update(set_params)
    end

    def destroy
      @request_situation.destroy
    end

    private

    def set_params
      params.require(:request_situation).permit(:name, :status)
    end

    def set_request_situations
      @request_situations = Sefaz::RequestSituation.all
    end

    def set_request_situation
      @request_situation = Sefaz::RequestSituation.find(params[:id])
    end
  end
end
