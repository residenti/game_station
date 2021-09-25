class StaticPagesController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def home
  end

  def show
  end
end
