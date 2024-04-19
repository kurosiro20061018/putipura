class User::EvaluationsController < ApplicationController
  before_action :authenticate_user!

  def new
    #新しい評価を作成するためのインスタンス変数を作成
    @evaluation = Evaluation.new
  end

  def create
    #ユーザーが入力した評価情報を使用して、評価を作成
    @evaluation = current_user.evaluations.new(evaluation_params)
     # 評価に関連付けられたアイテムを取得
    @item = Item.find(evaluation_params[:item_id])
    #評価の保存が成功した場合
    if @evaluation.save
      flash[:notice] = "レビューの追加に成功しました。"
      #評価を表示するためのパスにリダイレクト
      redirect_to user_item_path(@item)
    else
      flash.now[:alert] = "レビューの追加に失敗しました。"
      #評価の作成フォームを含むアイテムの詳細ページが再表示
      @item = Item.find(params[:evaluation][:item_id])
      @evaluations = @item.evaluations
      render "user/items/show"
    end
  end

  #def update
    #@evaluation = current_user.evaluations.new(evaluation_params)
    #if @evaluation.update(evaluation_params)
     # flash[:success] = "レビューの編集に成功しました。"
      #redirect_to user_item_path(@evaluation)
    #else
      #flash.now[:alert] = "レビューの編集に失敗しました。"
      #render update
    #end
  #end

  #def edit
    #@evaluation = Evaluation.find(params[:id])
  #end

  def index
    #全てのアイテムを取得してインスタンス変数に保存
    @evaluations = Evaluation.all
    @evaluation = Evaluation.new
  end

  #def show
    #@evaluation = Evaluation.find(params[:id])
  #end

  #def destroy
    #@evaluation =Evaluation.find(params[:id])
    #@evaluation.destroy
    #flash[:deleted] = "レビューの削除に成功しました。"
    #redirect_to user_item_path
  #end

  private

    def evaluation_params
      params.require(:evaluation).permit(:content, :item_id)
    end
end

