require_dependency 'brb/application_controller'

module Brb
	class CategoriesController < ApplicationController
		before_action :set_categories
		before_action :set_category, only: %i[edit update destroy]

		def index; end

		def new
			@category = Brb::Category.new
		end

		def create
			@category = Brb::Category.new(set_params)
			@category.save
		end

		def edit; end

		def update
			@category.update(set_params)
			@category.save
		end

		def destroy
			@category.destroy
		end

		private

		def set_params
			params.require(:category).permit(:name, :status, :invoice_type_id, :default_value)
		end

		def set_categories
			@categories = Brb::Category.all
		end

		def set_category
			@category = Brb::Category.find(params[:id])
		end

	end
end