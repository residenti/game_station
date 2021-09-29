class Invitation < ApplicationRecord
  belongs_to :club

  validates :token, presence: true, uniqueness: true
  validates :used, inclusion: { in: [true, false] }
end
