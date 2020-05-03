package com.weflors.entity;

import javax.persistence.*;

@Entity
@Table(name = "user_role_map", schema = "flowershop", catalog = "postgres")
@IdClass(UserRoleMapEntityPK.class)
public class UserRoleMapEntity {
    private int userId;
    private int roleId;
    private UserEntity userByUserId;
    private RoleEntity roleByRoleId;
    
    

    public UserRoleMapEntity() {
		
	}

	public UserRoleMapEntity( int roleId, int userId) {
		this.roleId = roleId;
		this.userId = userId;
		
	}

	@Id
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Id
    @Column(name = "role_id", nullable = false)
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserRoleMapEntity that = (UserRoleMapEntity) o;

        if (userId != that.userId) return false;
        if (roleId != that.roleId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + roleId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
    public UserEntity getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserEntity userByUserId) {
        this.userByUserId = userByUserId;
    }

    @ManyToOne
    @JoinColumn(name = "role_id", referencedColumnName = "role_id", nullable = false)
    public RoleEntity getRoleByRoleId() {
        return roleByRoleId;
    }

    public void setRoleByRoleId(RoleEntity roleByRoleId) {
        this.roleByRoleId = roleByRoleId;
    }
}
