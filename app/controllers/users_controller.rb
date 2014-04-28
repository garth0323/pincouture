class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
	before_action :require_same_user, only: [:edit, :update]
  
  def show
  	@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Welcome, you are registered"
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Updated"
			redirect_to user_path(@path)
		else
			render :edit
		end
	end
  
  def closet
  	@user = User.find(session[:user_id])
  end
  
  private
  
	def user_params
		params.require(:user).permit!
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user
			flash[:error] = "You can't do that on Pincouture"
			redirect_to root_path
		end
	end
end
