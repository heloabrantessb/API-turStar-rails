class CategoryPolicy < ApplicationPolicy

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def create?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
