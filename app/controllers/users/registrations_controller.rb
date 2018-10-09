# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
    resource.save
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 :gender, :school, :school_year)
  end

end
