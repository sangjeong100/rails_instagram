class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters,
	if: :devise_controller?
  #devise controller와 관련있을 때만 이를 실행한다.
  
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone_number,:profile_photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:phone_number,:profile_photo])
  end
  #회원가입과 update때 name,phone_number parameter사용


end
