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
  # アクティブであるかを判断するメソッド
  def user_state
  # 【処理内容1】 入力されたemailからアカウントを1件取得
  customer = Customer.find_by(email: params[:customer][:email])
  # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
  return if customer.nil?
  # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
  return unless customer.valid_password?(params[:customer][:password])
  # 【処理内容4】 アクティブでない会員に対する処理
    if customer.is_active
      return True
    else
      return redirect('new_user_session_path')

    
    end
  end
end
