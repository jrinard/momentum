class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authenticate_user! (after protect_from_forgery with: :exception line)
  before_action :authenticate_user!

end
