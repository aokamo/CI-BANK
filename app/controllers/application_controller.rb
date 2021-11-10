class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?

private
  def blog_params
    params.require(:admin).permit(:email, :encrypted_password)
  end
end
