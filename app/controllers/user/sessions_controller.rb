# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    user_items_path
  end
 
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email])
  end
  
  private
  # 退会しているかいないかを判断するメソッド
  def reject_end_user
  # 入力されたemailからアカウントを1件取得
  　@end_user = User.find_by(email: params[:end_user][:email])
  　if @end_user
  　#有効なパスワードであるが、退会済みである場合
      if @end_user.valid_password?(params[:end_user][:password]) && (@end_user.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_user_session_path
    #入力ミスによるユーザーが見つからない場合
      else
        flash[:notice] = "項目を再入力してください"
      end
    #登録がまだな場合
    else
      flash[:notice] = "該当するユーザーが見つかりません。新規登録をお願いします。"
    end
  end
end

