class Club < ApplicationRecord
  has_many :club_users
  has_many :users, through: :club_users

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

  def save_with_owner(current_user)
    ActiveRecord::Base.transaction do
      save!
      ClubUser.create!({club: self, user: current_user, ownered: true})
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end
