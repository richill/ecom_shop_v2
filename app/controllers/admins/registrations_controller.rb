class Admins::RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    dashboard_admin_path(current_admin)
  end
end
