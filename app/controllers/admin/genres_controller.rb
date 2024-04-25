class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def new
    @genre = Genre.new
  end
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save!
    flash[:notice] = "ジャンルの追加に成功しました。"
    redirect_to admin_genres_path
    else
    flash[:alert] = "ジャンルの追加に失敗しました。"
    @genres = Genre.all
    render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    flash[:success] = "ジャンルの更新に成功しました。"
    redirect_to admin_genres_path
    else
    flash.now[:alert] = "ジャンルの更新に失敗しました。"
    render :edit
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    flash[:deleted] = "ジャンルの削除に成功しました。"
    @genres = Genre.all  # ジャンルの一覧を再取得して@genresに代入
    redirect_to admin_genres_path
  end

  def search
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
  end

  private
  def genre_params
    params.require(:genre).permit(:name,:item_id,:genre)
  end
end