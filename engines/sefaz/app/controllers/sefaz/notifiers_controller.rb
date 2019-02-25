require_dependency 'sefaz/application_controller'

module Sefaz
  class NotifiersController < ApplicationController # :nodoc:
    before_action :set_notifiers
    before_action :set_notifier, only: %i[edit update destroy]

    def index; end

    def new
      @notifier = Sefaz::Notifier.new
    end

    def create
      @notifier = Sefaz::Notifier.new(set_params)
      @notifier.save
    end

    def edit; end

    def update
      @notifier.update(set_params)
    end

    def destroy
      @notifier.destroy
    end

    private

    def set_params
      params.require(:notifier).permit(:name, :cnpj, :status)
    end

    def set_notifiers
      @notifiers = Sefaz::Notifier.all
    end

    def set_notifier
      @notifier = Sefaz::Notifier.find(params[:id])
    end
  end
end
