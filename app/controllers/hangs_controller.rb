class HangsController < ApplicationController
  
  def new
    @hang = Hang.hangs.build
  end
  
  def create

    @post = Post.find(params[:post_id])
    @user = (session[:user_id])
    @hang = @hang.create(user_id: @user, post_id: @post)
    
    if @hang.save
      flash[:notice] = "Hung in your closet!"
  		redirect_to root_path
  	else
  		render :new
  	end
    
  end
end