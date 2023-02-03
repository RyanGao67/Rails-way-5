# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  USER_PARAMS = [:first_name, :last_name, :email, :phone, :phone_ext, :role, :password, :password_confirmation,
                 :sign_up_source, :utm_medium, :utm_campaign, :utm_source, :utm_term, :utm_content, :cid, :accepted_tos_2017_02,
                 :time_zone, :language, :sf_sync, :public_card_applicant]
  before_action :update_sanitized_params
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource_or_scope)
    welcome_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(*USER_PARAMS)}
  end
end
