class ClubsController < ApplicationController
  def show
    @club = authorize Club.find(params[:id])
    @owner = @club.owner
    @members = @club.members
  end

  def new
    @club = authorize Club.new
  end

  def create
    @club = authorize Club.new(club_params)
    if @club.save_with_owner(current_user)
      redirect_to @club
    else
      render :new
    end
  end

  def edit
    @club = authorize Club.find(params[:id])
  end

  def update
    @club = authorize Club.find(params[:id])
    if @club.update(club_params)
      redirect_to @club
    else
      render :edit
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :description)
  end
end
