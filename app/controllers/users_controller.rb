class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  # TODO
  # tokenでレコードを取得する
  # 取得したレコードが未使用であることをチェックする
  # 取得したレコードの有効期限(1日)をチェックする
  # club_usersテーブルにcurrent_user.idとclub.idでレコードを生成する
  # 使用済みにレコードを更新する
  # 参加先のクラブ招待画面へ遷移させる
  #
  # NOTE
  # セキュリティの観点からclubIDもtokenと一緒に送らせる？
  def join_club
  end
end
