class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    #### SuperAdmin
    can :manage, :all if user.role == "superadmin"
    #### Admin
    can :manage, :all if user.role == "admin"
    #### Leader
    can :read, :none if user.role == "leader"
    #### User is no role
    can :read, :none if user.role == "User"

    #Multiple Checkbox
    #   user ||= User.new
    # #### SuperAdmin
    #   if user.has_role? :superadmin
    #     can :manage, :all
    #
    # #### Admin
    #   elsif user.has_role? :admin
    #     can :manage, :all
    #
    # #### STAFF
    #   elsif user.has_role? :staff
    #     can :create, Department
    #     can :update, Department
    #     # can :destroy, Department
    #     can :read, :all
    #
    # #### User
    #   else
    #     can :read, :none
    #   end
  end
  
end
