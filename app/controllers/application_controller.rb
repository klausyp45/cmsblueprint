class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_pages
  before_action :check_application_status

  include LikesHelper

  protected

  def configure_permitted_parameters
    added_attrs = [
      :first_name, :last_name, :phone_number, :profile_picture,
      :billing_address, :country_of_residence, :province,
      :city_of_residence, :street_and_number, :postal_code,
      :date_of_birth, :gender
    ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  def check_application_status
    return if Setting.instance.live?
    return if devise_controller? && action_name == 'sign_out'
    
    if Setting.instance.offline?
      render plain: "Application is currently offline. #{Setting.instance.application_status_message}", status: :service_unavailable
    elsif Setting.instance.maintenance? && !current_user&.admin?
      render plain: "Application is in maintenance mode. #{Setting.instance.application_status_message}", status: :service_unavailable
    end
  end

  def load_pages
    @pages = Page.all
  end
end
