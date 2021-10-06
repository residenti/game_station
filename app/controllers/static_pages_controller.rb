class StaticPagesController < ApplicationController
  skip_before_action :logged_in_required
  skip_after_action :verify_authorized

  def home
  end
end
