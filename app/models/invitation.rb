class Invitation < ApplicationRecord
  belongs_to :club

  validates :token, presence: true, uniqueness: true
  validates :used, inclusion: { in: [true, false] }

  def validate(current_user)
    errors.add(:base, '使用済みの招待です。') and return if used
    errors.add(:base, '招待の有効期限が切れていいます。') and return if created_at.tomorrow < Time.current
    errors.add(:base, '既にクラブに参加しています。') and return if ClubUser.exists?(club: club, user: current_user)
  end
end
