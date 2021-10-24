class InvitationsController < ApplicationController
  skip_before_action :logged_in_required, only: :show
  skip_after_action :verify_authorized, only: :show

  def show
    # TODO 問答無用で登録/ログインせず、ユーザに確認取る
    unless logged_in?
      store_location
      repost('/auth/twitter', options: { authenticity_token: :auto }) and return
    end

    @invitation = Invitation.find_by!(token: params[:token], club_id: params[:club_id])
    @club = @invitation.club
  end

  def accept
    @club = Club.find(params[:club_id])
    @invitation = authorize Invitation.find_by!(token: params[:token], club: @club)
    @invitation.validate(current_user) # TODO リファクタリング 引数を無くす
    # NOTE unprocessable_entity を指定しないとレンダリングに失敗する
    # https://github.com/hotwired/turbo-rails/issues/12
    return render :show, status: :unprocessable_entity if @invitation.errors.any?

    @club.add_member!(current_user)

    redirect_to @club
  end
end
