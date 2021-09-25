class StaticPagesController < ApplicationController
  skip_before_action :logged_in_required, only: :home

  def home
  end
end
