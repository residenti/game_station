class InvitationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  %i[create? accept?].each do |action|
    define_method(action) { user.present? }
  end
end
