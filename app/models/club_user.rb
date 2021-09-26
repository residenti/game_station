class ClubUser < ApplicationRecord
  belongs_to :club
  belongs_to :user

  validates :ownered, inclusion: { in: [true, false] }
end
