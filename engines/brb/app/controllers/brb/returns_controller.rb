require_dependency 'brb/application_controller'

module Brb
  class ReturnsController < ApplicationController
    def create
      @return = Brb::Return.new(set_params)

      if @return.type == "1"
        if @return.valid?
          @return.agreement!
          redirect_to invoices_path
          flash[:success] = "Retorno de guia simples gravado com sucesso"
        else
          render action: 'new'
        end
      else
        if @return.valid?
          @return.process!
          redirect_to invoices_path
          flash[:success] = "Retorno de boleto gravado com sucesso"
        else
          render action: 'new'
        end
      end
    end

    def new
      @return = Return.new
      @type = params[:type]
    end




    private

    def set_params
      params.require(:return).permit(:file, :type)
    end

  end
end
