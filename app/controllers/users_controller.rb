class UsersController < ApplicationController
	include ApplicationHelper
	
	before_action :find_user, only: [:show, :edit, :update] 
	before_action :require_login, only: [:show, :edit]

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			redirect_to root_path
		end	
	end	

	def login
		@user = User.find_by(email: params[:session][:email])
		if @user != nil && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			flash[:info] = "Signed in sucessfully."
			redirect_to "/users/#{@user.id}"

		else
			redirect_to root_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:info] = "Signed out sucessfully."
     	redirect_to '/'
	end

	def show
		@task = Task.where(user_id: params[:id])
		@task =  @task.order("start_date ASC")
		@today_task = @task.where(start_date: DateTime.now)
	end 



	private
	def user_params
		params.require(:user).permit(:name, :password, :email)
	end

	def find_user
		if @user = User.find_by(id: params[:id])
			return @user
		else
			redirect_to "/", :flash => { :errors => "Error!!!!"}	
		end
	end

	def require_login
		if !logged_in?
			redirect_to root_path
		end	
	end

	

end
