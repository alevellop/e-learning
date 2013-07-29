class ApplicationController < ActionController::Base
  protect_from_forgery

  #Para redireccionar a 'sign in' despues de 'sig out'
  # def after_sign_out_path_for(resource_or_scope)

  # 	new_user_session_path
  # end
end
