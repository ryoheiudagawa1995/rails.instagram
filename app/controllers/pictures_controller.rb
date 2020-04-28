class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @picture.save
        UserMailer.user_mail(@picture).deliver
        redirect_to pictures_path, notice: "投稿を作成しました！"
      else
        render :new
      end
    end
  end

  def update
    if @picture.user.id == current_user.id
      if @picture.update(picture_params)
        redirect_to @picture, notice: 'Picture was successfully updated.'
        render :show, status: :ok, location: @picture
      else
        render :edit
        render json: @picture.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end
  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end
end
