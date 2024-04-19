class User::CustomersController < ApplicationController
  before_action :authenticate_user!
  def show
    # 自分のあかうんとを取得
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    # 送られてきたぱらめーたを保存
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      sign_in(@user, bypass: true)
      redirect_to user_my_page_path
    else
      flash.now[:alert] = "ユーザー情報の更新に失敗しました"
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
    @user.status = "退会"
    @user.save
    
  end

  def withdrawal
  end

  protected
    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :skin_quality, :skin_trouble)
    end
end
