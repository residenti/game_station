class InvitationsController < ApplicationController
  # TODO
  # 「参加する」ボタンがある画面へ遷移する
  # 「参加する」ボタンが押されると、POSTでjoin_clubメソッドを呼び出す
  def show
  end

  def create
    club = Club.find(params[:club_id])
    token = SecureRandom.urlsafe_base64
    invitation = Invitation.create!(club: club, token: token)
    @invitation_url = "http://localhost:3000/clubs/#{ club.id }/invitations/#{ invitation.id }?token=#{ invitation.token }" # TODO urlの直書きはやめる

    render partial: 'invitaion_urls'
  end
end
