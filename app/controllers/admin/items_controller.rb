class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
    @item = Item.new
    @genre = Genre.new
    @genres = Genre.all
  end

  def new
    @item = Item.new
    @genres = Genre.all.map { |genre| [genre.name, genre.id] }
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    flash[:notice] = "アイテムの追加に成功しました。"
    redirect_to admin_items_path
    else
    @genres = Genre.all.map { |genre| [genre.name, genre.id] }
    flash.now[:alert] = "アイテムの追加に失敗しました。"
    @items = Item.all
    render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @evaluations = @item.evaluations
    
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    flash[:success] = "アイテムの更新に成功しました。"
    redirect_to admin_items_path
    else
    flash.now[:alert] = "アイテムの更新に失敗しました。"
    render :edit
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:deleted] = "アイテムの削除に成功しました。"
    redirect_to admin_items_path
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :price, :genre_id, :image)
  end
  
end
