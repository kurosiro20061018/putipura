class User::ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
  end

  def show
    #評価を作成するためのインスタンス変数
    @evaluation = Evaluation.new
    #指定されたアイテムと
    @item = Item.find(params[:id])
    #それに関連する評価を取得
    @evaluations = @item.evaluations
  end
end
