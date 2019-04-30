module Pivotal
  class UserGroupPermissionEngine
    include ActiveModel::Model

    attr_accessor :group_permission_id, :creator_id, :user_id
    
    def save
      return false if !valid?

      @group_permission = Pivotal::PermissionGroup.find_by(id: self.group_permission_id)

      @ids = @group_permission.permission_ids.split(',')
      @permission = @ids.map{|k| k.to_i}
      
      @permission.each do |i|

        @user_group = Pivotal::UserPermission.new(
          permission_id: i,
          user_id: self.user_id, 
          creator_id: self.creator_id
        ) 

        @user_group.save

      end

      @permission_group_user = Pivotal::PermissionGroupUser.new(
        user_id: self.user_id,
        group_id: self.group_permission_id,
        creator_id: self.creator_id
      )

      @permission_group_user.save

    end

    def destroy
      return false if !valid?

      @group_permission = Pivotal::PermissionGroup.find_by(id: self.group_permission_id)

      @ids = @group_permission.permission_ids.split(',')
      @engine_permissions = @ids.map{|k| k.to_i}
      
      @user_engine_permissions = Pivotal::UserPermission.where(user_id: self.user_id, permission_id: @engine_permissions)
      
      @user_engine_permissions.each { |k| k.destroy }

      @permission_group_user = Pivotal::PermissionGroupUser.where(group_id: self.group_permission_id, user_id: self.user_id)
      @permission_group_user.each { |k| k.destroy }
    end
    
  end
end