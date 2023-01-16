class AdminPagesControllerPolicy < ApplicationPolicy
  def admin_home?
    user.admin?
  end

  # def admin_events?
  #   user.admin?
  # end

  # def admin_venues?
  #   user.admin?
  # end

  # def event_confirm?
  #   user.admin?
  # end

  # def event_destroy?
  #   user.admin?
  # end

  # def venue_confirm?
  #   user.admin?
  # end

  # def venue_destroy?
  #   user.admin?
  # end
end
