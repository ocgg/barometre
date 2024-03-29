class VenuePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def edit?
    update?
  end

  def update?
    return false if user.nil?

    record.user == user || user.admin?
  end
end
