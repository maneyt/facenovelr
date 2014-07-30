class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  before_action :require_login
  protect_from_forgery with: :exception

  helper_method :current_search
  def current_search
    Search.new
  end

end
