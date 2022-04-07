# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # POST /resource/sign_in
  def create
    helpers.no_tfa do
      helpers.require_tfa(phone_number: User.find_by(email: sign_in_params[:email]).phone, url: request.url, http_params: helpers.tfa_friendly_params(params))
    end
    helpers.if_tfa do |tfa|
      if tfa.phone == User.find_by(email: sign_in_params[:email]).phone
        super
      else
        head 401
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #  super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
