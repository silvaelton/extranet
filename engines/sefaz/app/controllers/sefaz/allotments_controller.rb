require_dependency 'sefaz/application_controller'

module Sefaz
  class AllotmentsController < ApplicationController # :nodoc:
    before_action :set_allotments
    before_action :set_allotment, only: %i[edit update destroy to_process send_exemption send_parcial_cancelation send_total_cancelation]

    has_scope :by_protocol
    has_scope :by_date
    has_scope :by_notifier
    has_scope :by_request_situation
    has_scope :by_exemption_type
    has_scope :by_cpf

    def index; end

    def new
      @allotment = Sefaz::Allotment.new
    end

    def create
      @allotment = Sefaz::Allotment.new(set_params)
      @allotment.request_situation_id = 1
      @allotment.save
    end

    def edit; end

    def update
      @allotment.update(set_params)
    end

    def destroy
      @allotment.destroy
    end

    def to_process
			@service = Sefaz::AllotmentService.new(@allotment)
      @service = @service.protocol_search!

			if @service == 'ok'
				redirect_to allotment_exemptions_path(@allotment.id)
			else
				flash["warning"] = process
				redirect_to allotments_path
			end
		end

		def send_exemption
      @service = Sefaz::AllotmentService.new(@allotment)
      @service = @service.send_allotment!(current_user.id)

			redirect_to allotments_path
		end

		def send_parcial_cancelation
      @service = Sefaz::AllotmentService.new(@allotment)
      @service = @service.send_parcial_cancelation!(current_user.id)

			redirect_to allotments_path
		end

		def send_total_cancelation
      @service = Sefaz::AllotmentService.new(@allotment)
      @service = @service.send_total_cancelation!(current_user.id)

			redirect_to allotments_path
		end

    private

    def set_params
      params.require(:allotment).permit(:exemption_type_id, :notifier_id,
                                        :observation, :request_type_id)
    end

    def set_allotments
      @allotments_all = apply_scopes(Sefaz::Allotment.order(id: :desc))
      @pagy, @allotments = pagy(@allotments_all)
    end

    def set_allotment
      params[:id] = params[:id].present? ? params[:id] : params[:allotment_id]
      @allotment = Sefaz::Allotment.find(params[:id])
    end
  end
end
