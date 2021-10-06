class ClubsController < ApplicationController
  def index
  end

  def show
    @club = Club.find(params[:id])
    @owner = @club.owner
    @members = @club.members
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save_with_owner(current_user)
      redirect_to @club
    else
      render :new
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      redirect_to @club
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def club_params
    params.require(:club).permit(:name, :description)
  end
end
