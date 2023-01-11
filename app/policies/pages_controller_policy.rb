class PagesControllerPolicy < ApplicationPolicy
  def admin?
    user.admin?
  end
end
