class UsersController < ApplicationController
	include ApplicationHelper
	
	before_action :find_user, only: [:show, :edit, :update, :dashboard] 
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
		@tasks = Task.where(user_id: params[:id]).order("start_date ASC")
		@today_task = @tasks.where(start_date: Date.today)
		@incompleted_task = @today_task.where(status: 0)
		@completed = @today_task.where(status: 1)
		@weekly_tasks = @tasks.where(start_date: (Date.today)+1..((Date.today)+7))

		@categories = @user.categories
	end 

	def dashboard
		@tasks = Task.where(user_id: params[:id]).order("start_date ASC")


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
