class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show]
  before_action :set_pin, only: [:new, :index, :edit, :create, :show]

  def index
    @posts = @pin.posts.order("created_at DESC")
  end

  def show
  end

  def new
    @post = @pin.posts.build
  end

  def edit
    @post = @pin.posts.find(params[:id])
  end

  def create
    page = MetaInspector.new(params[:post][:link])
    @post = @pin.posts.create(title: page.title, host: page.host, link: page.url, description: page.description, 
                              user_id: current_user[:id], pin_id: params[:pin_id], image: page.image)
    
    if @post.save
      redirect_to edit_pin_post_path(@pin, @post)
    else
      render action: 'new'
    end
  end

   def update
    if @post.update(post_params)
      redirect_to @post.pin, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  def hang
    @hang = Hang.create(user_id: current_user.id, post_id: (params[:id]))
    
    if @hang.save
      flash[:notice] = "Hung in your closet!"
  		redirect_to root_path
  	else
  		flash[:notice] = "There was a problem!"
      redirect_to root_path
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_pin
      @pin = Pin.find(params[:pin_id])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to pin_path, notice: "Not authorized to edit this post" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :image, :title)
    end


end