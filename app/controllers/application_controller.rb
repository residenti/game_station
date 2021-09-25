class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :logged_in_required

  private

  def logged_in_required
    redirect_to root_path unless current_user
  end
end
