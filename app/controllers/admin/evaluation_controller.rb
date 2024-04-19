class Admin::EvaluationController < ApplicationController
  before_action :authenticate_admin!
  def index
    @evaluations = Evaluation.all
    @evaluation = Evaluation.new
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    @item = @evaluation.item # 評価に関連するアイテムを取得
    @evaluation.destroy
    flash[:deleted] = "レビューの削除に成功しました。"
    redirect_to admin_item_path(@item) # 評価の削除後に該当アイテムの詳細ページにリダイレクト
  end
  
  private
  def evaluation_params
    params.require(:evaluation).permit(:content, :item_id)
  end
end
  
