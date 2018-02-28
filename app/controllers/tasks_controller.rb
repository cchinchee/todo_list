class TasksController < ApplicationController
	include ApplicationHelper

	def create
		@task = current_user.tasks.new(task_params)
		if @task.save
			flash[:success] = "ToDo created sucessfully."
			respond_to do |format|
			format.html {redirect_to "/users/#{current_user.id}"}
			format.js
			end
		else
			flash[:errors] = "Creation failed. Please try again."
			redirect_to "/users/#{@current_user.id}"
		end
	end

	def destroy
		@task = Task.find_by(id: params[:id])
		@task.destroy
		respond_to do |format|
		format.html { redirect_to "/users/#{current_user.id}" }
		format.js
		end
	end 

	private
	def task_params
		params.require(:task).permit(:title, :details, :start_date)
	end
end
