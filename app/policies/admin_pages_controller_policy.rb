class AdminPagesControllerPolicy < ApplicationPolicy
  def admin_home?
    user.admin?
  end

  def admin_events?
    user.admin?
  end

  def admin_venues?
    user.admin?
  end
end
