class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception

  before_action :require_login

  private

  def require_login
    unless signed_in?
      redirect_to root_path
    end
  end
end
