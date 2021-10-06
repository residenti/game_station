class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pundit
  before_action :logged_in_required
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  private

  def logged_in_required
    redirect_to root_path unless current_user
  end
end
