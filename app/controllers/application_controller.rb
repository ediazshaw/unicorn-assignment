class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    type_path
  end
end
