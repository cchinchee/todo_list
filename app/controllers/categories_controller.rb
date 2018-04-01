class CategoriesController < ApplicationController
	before_action :find_category, only: [:show] 

	def show
		@tasks = Task.where(category_id: params[:id]).order("start_date ASC")

	end 

	def find_category
		if @category = User.find_by(id: params[:id])
			return @user
		end
	end
end
