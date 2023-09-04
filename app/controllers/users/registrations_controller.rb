class Users::RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    account_saved_items_user_path(resource)
  end
end