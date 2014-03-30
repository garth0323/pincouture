class CelebritiesController < ApplicationController
  
  def index
  	@celebrities = Celebrity.all.order("name ASC").paginate(:page => params[:page], :per_page => 8)
  end

  def new
  	@celebrity = Celebrity.new
  end

  def create
 		@celebrity = Celebrity.new(celebrity_params)
 		@celebrity.gender = params[:gender]
 		@celebrity.save

		if @celebrity.save
			flash[:notice] = "Celebrity has been added"
			redirect_to root_path
		else
			render :new
		end
  end

  private

	def celebrity_params
		params.require(:celebrity).permit(:name, :gender)
	end

end