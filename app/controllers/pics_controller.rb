class PicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pic, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  

 



  def index
    @pics = Pic.all
  end




  def show
  end

 
  def new
    @pic = current_user.pics.build
  end


  def edit
  end

 
  def create
    @pic = current_user.pics.build(pic_params)
      if @pic.save
        redirect_to @pic, notice: 'Pic was successfully created.'
      else
        render action: 'new'
      end
    end
  end

  def update
      if @pic.update(pic_params)
        redirect_to @pic, notice: 'Pic was successfully updated.'
      else
        render action: 'edit'
      end

 
  def destroy
    @pic.destroy
    redirect_to pics_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    def correct_user
      @pic = current_user.pics.find_by(id: params[:id])
      redirect_to pics_path, notice: "Not authorized to edit this pic" if @pic.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pic_params
      params.require(:pic).permit(:description, :image)
    end
