class Club < ApplicationRecord
  has_many :club_users
  has_many :users, through: :club_users
  has_many :invitations

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

  def owner
    users.find_by(club_users: { ownered: true })
  end

  def save_with_owner(current_user)
    ActiveRecord::Base.transaction do
      save!
      ClubUser.create!({club: self, user: current_user, ownered: true})
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  def add_member!(user)
    ClubUser.create!(club: self, user: user, ownered: false)
  end
end
