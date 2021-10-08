class ClubPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  %i[show? new? create?].each do |action|
    define_method(action) { user.present? }
  end

  %i[edit? update? resign_member?].each do |action|
    define_method(action) { record.owner == user }
  end
end
