class User < ApplicationRecord
  has_many :club_users
  has_many :clubs, through: :club_users

  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by(uid: auth_hash[:uid]) do |user|
      user.nickname = auth_hash[:info][:nickname]
      user.name = auth_hash[:info][:name]
      user.profile_icon_url = auth_hash[:info][:image]
    end
  end
end
