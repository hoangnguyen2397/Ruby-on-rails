# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record
  # In the generated ApplicationPolicy, the model object is called record
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    # Sometimes you want to retrieve a policy for a record outside the controller or view. For example when you delegate permissions from one policy to another.
    # The bang methods will raise an exception if the policy does not exist, whereas those without the bang will return nil.
    Pundit.policy_scope!(user, record.class)
  end
  
  # Often, you will want to have some kind of view listing records which a particular user has access to. Like admin or user.
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
