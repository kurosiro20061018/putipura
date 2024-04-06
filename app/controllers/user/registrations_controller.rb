# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  def after_sign_in_path_for(resource)
    user_items_path
  end
  
  protected
  def configure_sign_up_params
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :age, :skin_quality, :skin_trouble])
  end

end
