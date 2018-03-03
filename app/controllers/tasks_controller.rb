class TasksController < ApplicationController
	include ApplicationHelper
	before_action :find_task, only: [:edit, :update, :edit_update]

	def create
		@task = current_user.tasks.new(task_params)
		if @task.save
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

	def update
		if current_user.id == @task.user_id
			@task.update(task_params)
			flash[:success] = "ToDo updated sucessfully."
			redirect_to "/users/#{@task.user_id}/dashboard"
		else
			flash[:errors] = "Update failed!"
			redirect_to "/users/#{@task.user_id}/dashboard"
				
		end
	end


	def edit_update
		if current_user.id == @task.user_id

			@task.update(task_params)

			respond_to do |format|
			format.html { redirect_to "/users/#{current_user.id}" }
			format.js
			end
			# flash[:success] = "ToDo updated sucessfully."
			# redirect_to "/users/#{@task.user_id}"
		else
			flash[:errors] = "Update failed!"
			redirect_to "/users/#{@task.user_id}"
				
		end
	end
	

	private
	def task_params
		params.require(:task).permit(:title, :details, :start_date, :status)
	end

	def find_task
		@task = Task.find_by(id: params[:id])
	end 

	def completed_task
		@tasks = Task.find_by(id: params[:id])
		@today_task = @tasks.where(start_date: DateTime.now)
		@incompleted = @today_task.where(status: 0)
	end
end
