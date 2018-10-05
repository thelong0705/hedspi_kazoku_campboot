# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    resource.save
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 :gender, :company, :school_year)
  end

end
