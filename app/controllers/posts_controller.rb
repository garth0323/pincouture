class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]

  def index
    @pin = Pin.find(params[:pin_id])
    @posts = @pin.posts.order("created_at DESC")
  end

  def show
  end

  def new
    @pin = Pin.find(params[:pin_id])
    @post = @pin.posts.build
  end

  def edit
    @pin = Pin.find(params[:pin_id])
    @post = @pin.post.find(params[:id])
  end

  def create
    @pin = Pin.find(params[:pin_id])
    page = MetaInspector.new(params[:retail_site])
    @post = @pin.posts.create(title: page.title, host: page.host, link: page.url, description: page.description, 
                              user_id: current_user[:id], pin_id: params[:pin_id], image: page.image)
    
    if @post.save
      redirect_to edit_pin_post_path(@pin, @post), notice: 'Confirm Info on Post.' #change when posts are made
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
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