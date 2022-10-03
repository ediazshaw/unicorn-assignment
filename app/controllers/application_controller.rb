class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    type_path # redirecting to type_path after login
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
