# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: [:new, :create]
  
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
  
  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :picture, :gender, :name, :school, :school_year)
  end

end
