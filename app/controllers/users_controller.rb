class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def star
    @pictures = current_user.favorite_pictures
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
      if @user.save
        redirect_to users_path, notice: 'ユーザーを登録しました。'
      else
        render :new
      end
    end
  end

  def update
    if @user.id == current_user.id
      if @user.update(user_params)
        redirect_to @user, notice: '編集しました！'
      else
        render :edit
      end
    end
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :face, :face_cache, :password, :password_confirmation)
  end
end
