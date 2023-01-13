class AdminPagesControllerPolicy < ApplicationPolicy
  def admin_home?
    user.admin?
  end
end
