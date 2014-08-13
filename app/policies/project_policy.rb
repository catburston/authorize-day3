class ProjectPolicy < ApplicationPolicy
  def create?
    user.po? || user.admin?
  end

  def delete?
    user.admin?
  end

  def update?
    user.admin?
  end
end